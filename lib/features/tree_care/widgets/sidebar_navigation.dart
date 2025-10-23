import 'package:flutter/material.dart';

class SidebarNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const SidebarNavigation({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = [
      SidebarItem(icon: Icons.show_chart, label: 'Analytics'),
      SidebarItem(icon: Icons.park, label: 'Trees'),
      SidebarItem(icon: Icons.groups, label: 'Caretakers'),
      SidebarItem(icon: Icons.account_balance_wallet, label: 'Finances'),
      SidebarItem(icon: Icons.notifications, label: 'Notifications'),
      SidebarItem(icon: Icons.settings, label: 'Settings'),
    ];

    return Container(
      width: 220,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.green[400],
                  borderRadius: BorderRadius.circular(12),
                ),
                width: 40,
                height: 40,
                child: Icon(Icons.nature, color: Colors.white, size: 28),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('TreeCare', style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20
                  )),
                  Text('Analytics', style: TextStyle(
                    color: Colors.grey[600], fontSize: 13
                  )),
                ],
              ),
            ],
          ),
          SizedBox(height: 24),
          ...items.asMap().entries.map((entry) {
            int idx = entry.key;
            SidebarItem item = entry.value;
            bool selected = idx == selectedIndex;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Material(
                color: selected ? Colors.green[50] : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  onTap: () => onItemSelected(idx),
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 10),
                    child: Row(
                      children: [
                        Icon(
                          item.icon,
                          color: selected
                              ? Colors.green[600]
                              : Colors.grey[700],
                        ),
                        SizedBox(width: 14),
                        Text(
                          item.label,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: selected
                                ? Colors.green[700]
                                : Colors.grey[800],
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class SidebarItem {
  final IconData icon;
  final String label;
  SidebarItem({required this.icon, required this.label});
}
