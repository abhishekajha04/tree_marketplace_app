import 'package:flutter/material.dart';

import '../widgets/user_table.dart';

class UserManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      body: Row(
        children: [
         
        
          // Main content
          Expanded(
            child: Column(
              children: [
                // Header section
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                  color: Colors.white,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('User Management',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 21)),
                            SizedBox(height: 2),
                            Text(
                              'Manage and monitor user accounts',
                              style: TextStyle(color: Colors.grey[700], fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.grey[300],
                        child: Icon(Icons.person, color: Colors.grey[700]),
                      ),
                      SizedBox(width: 6),
                      Text('Admin User', style: TextStyle(fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                // Filters row
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  color: Colors.white,
                  child: Row(
                    children: [
                      _DropdownFilter(label: 'Status:', value: 'All Users', items: ['All Users', 'Active', 'Inactive']),
                      SizedBox(width: 22),
                      _DropdownFilter(label: 'KYC Status:', value: 'All KYC', items: ['All KYC', 'Verified', 'Pending', 'Rejected']),
                      SizedBox(width: 22),
                      SizedBox(
                        width: 220,
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: "Search users...",
                            hintStyle: TextStyle(color: Colors.grey[600]),
                            filled: true,
                            fillColor: Color(0xFFF6F8FA),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                            contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                          ),
                        ),
                      ),
                      Spacer(),
                      SizedBox(
  height: 42,
  child: ElevatedButton.icon(
    onPressed: () {},
    icon: Icon(Icons.add, color: Colors.white), 
    label: Text(
      'Add User',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white, 
      ),
    ),
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF3952FF), 
      foregroundColor: Colors.white,
      shape: StadiumBorder(),
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
    ),
  ),
)

                    ],
                  ),
                ),
                // Users Table
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(0),
                    child: UserTable(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Dropdown filter widget
class _DropdownFilter extends StatelessWidget {
  final String label;
  final String value;
  final List<String> items;
  const _DropdownFilter({required this.label, required this.value, required this.items});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
        SizedBox(width: 5),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xFFE6EEF7)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              items: items
                  .map((e) => DropdownMenuItem(
                        child: Text(e),
                        value: e,
                      ))
                  .toList(),
              onChanged: (_) {},
              style: TextStyle(fontSize: 14),
              icon: Icon(Icons.keyboard_arrow_down_rounded),
            ),
          ),
        ),
      ],
    );
  }
}
