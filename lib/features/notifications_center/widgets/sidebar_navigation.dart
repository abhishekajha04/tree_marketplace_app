import 'package:flutter/material.dart';

class SidebarNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 32),
          Row(
            children: [
              SizedBox(width: 18),
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Color(0xFF2979FF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.notifications, color: Colors.white, size: 22),
              ),
              SizedBox(width: 12),
              Text("NotifyHub", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ],
          ),
          SizedBox(height: 36),
          _SidebarItem(
            icon: Icons.notifications,
            label: "All Notifications",
            active: true,
            trailing: "12",
          ),
          _SidebarItem(
            icon: Icons.flash_on, 
            label: "Recent Actions",
            active: false,
            trailing: "8",
          ),
          _SidebarItem(
            icon: Icons.attach_money, 
            label: "Pending Payouts",
            active: false,
            trailing: "3",
            trailingColor: Colors.red,
          ),
          _SidebarItem(
            icon: Icons.arrow_upward,
            label: "Updates",
            active: false,
            trailing: "1",
            trailingColor: Colors.green,
          ),
          _SidebarItem(
            icon: Icons.settings,
            label: "Settings",
            active: false,
          ),
        ],
      ),
    );
  }

  Widget _SidebarItem({
    required IconData icon,
    required String label,
    required bool active,
    String? trailing,
    Color? trailingColor,
  }) {
    final itemColor = active ? Color(0xFF2979FF) : Colors.grey[700];
    final bgColor = active ? Color(0xFFE6EEFF) : Colors.transparent;

    return Container(
      color: bgColor,
      padding: EdgeInsets.only(right: 8),
      child: Row(
        children: [
          SizedBox(width: 18),
          Icon(icon, color: itemColor, size: 19),
          SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                label,
                style: TextStyle(
                  color: itemColor,
                  fontWeight: active ? FontWeight.bold : FontWeight.normal,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          if (trailing != null)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 2),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                trailing,
                style: TextStyle(
                  color: trailingColor ?? (active ? itemColor : Colors.grey[700]),
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
