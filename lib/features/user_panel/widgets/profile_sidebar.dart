import 'package:flutter/material.dart';

class ProfileSidebar extends StatelessWidget {
  final int selectedIndex;

  ProfileSidebar({this.selectedIndex = 1}); 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 18),
          Row(
            children: [
              SizedBox(width: 20),
              CircleAvatar(
                backgroundColor: Color(0xFF2362EC),
                child: Icon(Icons.account_circle, color: Colors.white),
              ),
              SizedBox(width: 12),
              Text('UserPanel', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ],
          ),
          SizedBox(height: 32),
          _buildMenuItem(Icons.home, "Dashboard", selectedIndex == 0),
          _buildMenuItem(Icons.person, "Profile", selectedIndex == 1),
          _buildMenuItem(Icons.credit_card, "Payments", selectedIndex == 2),
          _buildMenuItem(Icons.show_chart, "Analytics", selectedIndex == 3),
          _buildMenuItem(Icons.settings, "Settings", selectedIndex == 4),
          Spacer(),
          Divider(),
          _buildBottomMenuItem(Icons.logout, "Logout"),
          SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, bool selected) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Material(
        color: selected ? Color(0xFFEFF5FE) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {},
          child: Container(
            height: 44,
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Icon(icon, size: 22, color: selected ? Color(0xFF2362EC) : Colors.black54),
                SizedBox(width: 16),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    color: selected ? Color(0xFF2362EC) : Colors.black87,
                    fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomMenuItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {},
        child: Container(
          height: 44,
          child: Row(
            children: [
              Icon(icon, size: 22, color: Colors.black54),
              SizedBox(width: 16),
              Text(
                title,
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
