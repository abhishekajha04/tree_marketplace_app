import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class Sidebar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const Sidebar({
    Key? key,
    this.selectedIndex = 0,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = [
      _SidebarItem(Icons.dashboard, "Dashboard"),
      _SidebarItem(Icons.nature, "Trees Management"),
      _SidebarItem(Icons.group, "Users"),
      _SidebarItem(Icons.person, "Caretakers"),
      _SidebarItem(Icons.attach_money, "Transactions"),
      _SidebarItem(Icons.analytics, "Analytics"),
      _SidebarItem(Icons.notifications, "Notifications"),
      _SidebarItem(Icons.settings, "Settings"),
    ];
    return Container(
      width: 230,
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: AppColors.primaryGreen,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.park,
                    color: AppColors.white,
                    size: 28,
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "TreeCare",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: AppColors.textTitle,
                      ),
                    ),
                    Text(
                      "Admin",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: AppColors.textTitle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          ...List.generate(items.length, (index) {
            final item = items[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                tileColor: index == selectedIndex
                    ? AppColors.primaryGreen.withOpacity(0.12)
                    : Colors.transparent,
                leading: Icon(
                  item.icon,
                  color: index == selectedIndex
                      ? AppColors.primaryGreen
                      : AppColors.textBody,
                ),
                title: Text(
                  item.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: index == selectedIndex
                        ? AppColors.primaryGreen
                        : AppColors.textBody,
                  ),
                ),
                onTap: () => onItemSelected(index),
              ),
            );
          }),
          Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}

class _SidebarItem {
  final IconData icon;
  final String title;
  _SidebarItem(this.icon, this.title);
}
