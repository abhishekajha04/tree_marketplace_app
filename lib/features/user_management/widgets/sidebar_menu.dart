import 'package:flutter/material.dart';

class SidebarMenu extends StatelessWidget {
  final String selectedKey;
  const SidebarMenu({required this.selectedKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 22),
          Row(
            children: [
              SizedBox(width: 18),
              Icon(Icons.dashboard, size: 28, color: Color(0xFF3952FF)),
              SizedBox(width: 10),
              Text('UserAdmin',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 32),
          _SidebarItem(
            icon: Icons.people,
            label: 'Users',
            isSelected: selectedKey == 'Users',
          ),
          _SidebarItem(
            icon: Icons.bar_chart,
            label: 'Analytics',
            isSelected: selectedKey == 'Analytics',
          ),
          _SidebarItem(
            icon: Icons.settings,
            label: 'Settings',
            isSelected: selectedKey == 'Settings',
          ),
        ],
      ),
    );
  }
}

class _SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  const _SidebarItem({required this.icon, required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFF3952FF).withOpacity(0.07) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: isSelected ? Color(0xFF3952FF) : Colors.grey[700]),
        title: Text(label, style: TextStyle(color: isSelected ? Color(0xFF3952FF) : Colors.grey[800], fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
        onTap: () {},
        hoverColor: Color(0xFFF2F6F7),
      ),
    );
  }
}
