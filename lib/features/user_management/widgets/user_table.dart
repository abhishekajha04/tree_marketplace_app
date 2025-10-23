import 'package:flutter/material.dart';


class StatusBadge extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;

  const StatusBadge({required this.text, required this.color, this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15), // Use a lighter background color
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class ActionButtons extends StatelessWidget {
  const ActionButtons();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.play_arrow_outlined, size: 20, color: Colors.grey),
        const SizedBox(width: 8),
        const Icon(Icons.pause_outlined, size: 20, color: Colors.grey),
        const SizedBox(width: 8),
       
        InkWell(
          onTap: () {},
          child: const Icon(Icons.more_vert, size: 20, color: Colors.grey),
        ),
      ],
    );
  }
}



class UserTable extends StatelessWidget {
 final List<Map<String, dynamic>> users = const [
  {
    "name": "Alex Morgan",
    "email": "alex.morgan@example.com",
    "id": "#99210",
    "avatar": null,
    "status": "Active",
    "kyc": "Verified",
    "join": "Sep 5, 2023",
  },
  {
    "name": "Priya Patel",
    "email": "priya.patel@example.com",
    "id": "#99211",
    "avatar": null,
    "status": "Inactive",
    "kyc": "Pending",
    "join": "Sep 2, 2023",
  },
  {
    "name": "Lucas Schmidt",
    "email": "lucas.schmidt@example.com",
    "id": "#99212",
    "avatar": null,
    "status": "Active",
    "kyc": "Rejected",
    "join": "Aug 28, 2023",
  },
  {
    "name": "Nao Yamamoto",
    "email": "nao.yamamoto@example.com",
    "id": "#99213",
    "avatar": null,
    "status": "Active",
    "kyc": "Verified",
    "join": "Aug 20, 2023",
  },
];


  Color _getStatusColor(String status) {
    switch (status) {
      case "Active":
      case "Verified":
        return const Color(0xFF28A745); 
      case "Inactive":
      case "Pending":
        return const Color(0xFFFFC107); 
      case "Rejected":
        return const Color(0xFFDC3545);
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
   
    final tableHeight = 56.0 * (users.length + 1); 

    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, top: 18),
            child: Text(
              "Total: 100 users",
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          ),
         
          ConstrainedBox(
            constraints: BoxConstraints(minHeight: tableHeight),
            child: DataTable(
              columnSpacing: 24,
              horizontalMargin: 18, 
              dataRowMinHeight: 56, 
              dataRowMaxHeight: 56,
              checkboxHorizontalMargin: 12,
             
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Color(0xFFE0E0E0), width: 1.0)),
              ),
              // Define the columns (Headers)
              columns: const [
                DataColumn(label: Text("User")),
                DataColumn(label: Text("Email")),
                DataColumn(label: Text("Status")),
                DataColumn(label: Text("KYC Status")),
                DataColumn(label: Text("Join Date")),
                DataColumn(label: Text("Actions")),
              ],
            
              rows: users.map<DataRow>((user) {
                final statusColor = _getStatusColor(user["status"]);
                final kycColor = _getStatusColor(user["kyc"]);

                return DataRow(
                  cells: [
                    DataCell(
                      Row(
                        children: [
                          Checkbox(
                            value: false, 
                            onChanged: (bool? newValue) {},
                          ),
                         
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.blueGrey.shade100,
                            child: Text(user["name"][0]),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(user["name"], style: const TextStyle(fontWeight: FontWeight.w600)),
                              Text("ID: ${user["id"]}", style: const TextStyle(fontSize: 12, color: Colors.grey)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    DataCell(Text(user["email"])),
                    DataCell(
                      StatusBadge(text: user["status"], color: statusColor),
                    ),
                    DataCell(
                      StatusBadge(text: user["kyc"], color: kycColor),
                    ),
                    DataCell(Text(user["join"])),
                    const DataCell(ActionButtons()),
                  ],
                );
              }).toList(),
            ),
          ),

       
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                Expanded(child: Text("Showing 1 to ${users.length} of 100 results", style: TextStyle(fontSize: 12, color: Colors.grey[600]))),
                const SizedBox(width: 12),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}


