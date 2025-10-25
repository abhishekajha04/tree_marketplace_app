import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class StatusBadge extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;
  final IconData? icon;

  const StatusBadge({
    required this.text,
    required this.bgColor,
    required this.textColor,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            Icon(icon, color: textColor, size: 15),
          if (icon != null)
            const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

class ActionButtons extends StatelessWidget {
  final bool isActive;
  final VoidCallback onView;
  final VoidCallback onToggleStatus;
  final VoidCallback onMoreOptions;

  const ActionButtons({
    required this.isActive,
    required this.onView,
    required this.onToggleStatus,
    required this.onMoreOptions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onView,
          child: Icon(Icons.visibility_outlined, size: 20, color: Colors.grey[500]),
        ),
        const SizedBox(width: 8),
        InkWell(
          onTap: onToggleStatus,
          child: Icon(
            isActive ? Icons.pause_outlined : Icons.play_arrow_outlined,
            size: 20,
            color: Colors.grey[500],
          ),
        ),
        const SizedBox(width: 8),
        InkWell(
          onTap: onMoreOptions,
          child: Icon(Icons.more_vert, size: 20, color: Colors.grey[500]),
        ),
      ],
    );
  }
}

class UserTable extends StatefulWidget {
  const UserTable({super.key});

  @override
  State<UserTable> createState() => _UserTableState();
}

class _UserTableState extends State<UserTable> {
  final List<Map<String, dynamic>> _initialUsers = [
    {
      "name": "Sarah Johnson",
      "email": "sarah.johnson@email.com",
      "id": "#12345",
      "avatar": null,
      "status": "Active",
      "kyc": "Verified",
      "join": "Oct 15, 2023",
      "selected": false,
    },
    {
      "name": "Michael Chen",
      "email": "michael.chen@email.com",
      "id": "#12346",
      "avatar": null,
      "status": "Inactive",
      "kyc": "Pending",
      "join": "Oct 12, 2023",
      "selected": false,
    },
    {
      "name": "Emma Davis",
      "email": "emma.davis@email.com",
      "id": "#12347",
      "avatar": null,
      "status": "Active",
      "kyc": "Rejected",
      "join": "Oct 10, 2023",
      "selected": false,
    },
    {
      "name": "James Wilson",
      "email": "james.wilson@email.com",
      "id": "#12348",
      "avatar": null,
      "status": "Active",
      "kyc": "Verified",
      "join": "Oct 8, 2023",
      "selected": false,
    },
  ];

  late List<Map<String, dynamic>> users;
  bool allSelected = false;

  @override
  void initState() {
    super.initState();
    users = List.from(_initialUsers);
  }

  Color getStatusBgColor(String status) {
    switch (status) {
      case "Active":
        return AppColors.primaryGreen.withOpacity(0.15);
      case "Inactive":
        return AppColors.error.withOpacity(0.15);
      default:
        return AppColors.lightGrey;
    }
  }

  Color getStatusTextColor(String status) {
    switch (status) {
      case "Active":
        return AppColors.primaryGreen;
      case "Inactive":
        return AppColors.error;
      default:
        return AppColors.textBody;
    }
  }

  Color getKycBgColor(String kyc) {
    switch (kyc) {
      case "Verified":
        return AppColors.primaryGreen.withOpacity(0.15);
      case "Pending":
        return AppColors.orange.withOpacity(0.2);
      case "Rejected":
        return AppColors.error.withOpacity(0.15);
      default:
        return AppColors.lightGrey;
    }
  }

  Color getKycTextColor(String kyc) {
    switch (kyc) {
      case "Verified":
        return AppColors.primaryGreen;
      case "Pending":
        return AppColors.orange;
      case "Rejected":
        return AppColors.error;
      default:
        return AppColors.textBody;
    }
  }

  IconData? getKycIcon(String kyc) {
    switch (kyc) {
      case "Verified":
        return Icons.check;
      case "Pending":
        return Icons.fiber_manual_record;
      case "Rejected":
        return Icons.close;
      default:
        return null;
    }
  }

  void _toggleUserSelection(int index) {
    setState(() {
      users[index]["selected"] = !users[index]["selected"];
      _updateAllSelected();
    });
  }

  void _toggleAllSelection() {
    setState(() {
      allSelected = !allSelected;
      for (var user in users) {
        user["selected"] = allSelected;
      }
    });
  }

  void _updateAllSelected() {
    allSelected = users.every((user) => user["selected"] == true);
  }

  void _toggleUserStatus(int index) {
    setState(() {
      users[index]["status"] = users[index]["status"] == "Active" ? "Inactive" : "Active";
    });
    
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${users[index]["name"]} status changed to ${users[index]["status"]}'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _viewUserDetails(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('User Details - ${users[index]["name"]}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Email: ${users[index]["email"]}'),
            Text('ID: ${users[index]["id"]}'),
            Text('Status: ${users[index]["status"]}'),
            Text('KYC: ${users[index]["kyc"]}'),
            Text('Join Date: ${users[index]["join"]}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showMoreOptions(int index) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit User'),
              onTap: () {
                Navigator.of(context).pop();
                _editUser(index);
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Delete User'),
              onTap: () {
                Navigator.of(context).pop();
                _deleteUser(index);
              },
            ),
            ListTile(
              leading: const Icon(Icons.content_copy),
              title: const Text('Copy User ID'),
              onTap: () {
                Navigator.of(context).pop();
                _copyUserId(index);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _editUser(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit User'),
        content: const Text('Edit user functionality would go here.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('User updated successfully')),
              );
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _deleteUser(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete User'),
        content: Text('Are you sure you want to delete ${users[index]["name"]}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                users.removeAt(index);
              });
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('User deleted successfully')),
              );
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _copyUserId(int index) {
   
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Copied: ${users[index]["id"]}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightGrey,   
      padding: const EdgeInsets.all(16),
      alignment: Alignment.topCenter,
      child: Card(
        color: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            children: [
              // Header section
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 2, left: 8, right: 8),
                child: Row(
                  children: [
                    Text(
                      "Users List",
                      style: TextStyle(
                        color: AppColors.textTitle,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 14),
                child: Row(
                  children: [
                    Text(
                      "Total: ${users.length} users",
                      style: TextStyle(
                        color: AppColors.textBody,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),

              // Data table content
              DataTable(
                columnSpacing: 82,
                horizontalMargin: 0,
                dataRowMinHeight: 24,
                dataRowMaxHeight: 60,
                headingRowColor: MaterialStateProperty.all(AppColors.lightGrey),
                dividerThickness: 0,
                showBottomBorder: false,
                columns: [
                  DataColumn(
                    label: SizedBox(
                      width: 180,
                      child: Row(
                        children: [
                          Checkbox(
                            value: allSelected,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            onChanged: (bool? newValue) {
                              _toggleAllSelection();
                            },
                            side: BorderSide(color: AppColors.borderColor),
                            visualDensity: VisualDensity.compact,
                          ),
                          const Text("User"),
                        ],
                      ),
                    ),
                  ),
                  const DataColumn(label: SizedBox(width: 210, child: Text("Email"))),
                  const DataColumn(label: SizedBox(width: 90, child: Text("Status"))),
                  const DataColumn(label: SizedBox(width: 120, child: Text("KYC Status"))),
                  const DataColumn(label: SizedBox(width: 90, child: Text("Join Date"))),
                  const DataColumn(label: Text("Actions")),
                ],
                rows: users.asMap().entries.map<DataRow>((entry) {
                  final index = entry.key;
                  final user = entry.value;
                  return DataRow(
                    cells: [
                      DataCell(
                        Row(
                          children: [
                            Checkbox(
                              value: user["selected"] ?? false,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              onChanged: (bool? newValue) {
                                _toggleUserSelection(index);
                              },
                              side: BorderSide(color: AppColors.borderColor),
                              visualDensity: VisualDensity.compact,
                            ),
                            if (user["avatar"] == null)
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                child: CircleAvatar(
                                  radius: 22,
                                  backgroundColor: AppColors.lightGrey,
                                  child: Text(
                                    user["name"].toString().substring(0, 1),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(user["name"],
                                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: AppColors.textTitle)),
                                Text("ID: ${user["id"]}",
                                    style: TextStyle(fontSize: 12, color: AppColors.textBody)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      DataCell(Text(user["email"], style: TextStyle(color: AppColors.textBody, fontSize: 15))),
                      DataCell(
                        StatusBadge(
                          text: user["status"],
                          bgColor: getStatusBgColor(user["status"]),
                          textColor: getStatusTextColor(user["status"]),
                          icon: Icons.fiber_manual_record,
                        ),
                      ),
                      DataCell(
                        StatusBadge(
                          text: user["kyc"],
                          bgColor: getKycBgColor(user["kyc"]),
                          textColor: getKycTextColor(user["kyc"]),
                          icon: getKycIcon(user["kyc"]),
                        ),
                      ),
                      DataCell(Text(user["join"], style: TextStyle(color: AppColors.textBody))),
                      DataCell(
                        ActionButtons(
                          isActive: user["status"] == "Active",
                          onView: () => _viewUserDetails(index),
                          onToggleStatus: () => _toggleUserStatus(index),
                          onMoreOptions: () => _showMoreOptions(index),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
              
              
              Padding(
                padding: const EdgeInsets.only(top: 12.0, left: 8, bottom: 8),
                child: Row(
                  children: [
                    Text(
                      "Showing 1 to ${users.length} of ${users.length} results",
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.textBody,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}