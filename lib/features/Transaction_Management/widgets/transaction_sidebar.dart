import 'package:flutter/material.dart';

class TransactionSidebar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const TransactionSidebar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          right: BorderSide(
            color: Colors.grey[300]!,
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(2, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo Section
          _buildLogoSection(),
          
          // Navigation Items
          _buildNavigationItems(),
          
          const Spacer(),
          
         
        ],
      ),
    );
  }

  Widget _buildLogoSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[300]!,
            width: 1,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'FinanceHub',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Transaction Manager',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationItems() {
    final navItems = [
      _NavItem(title: 'Dashboard', icon: Icons.dashboard_outlined),
      _NavItem(title: 'Transactions', icon: Icons.account_balance_wallet_outlined),
      _NavItem(title: 'Users', icon: Icons.people_outline),
      _NavItem(title: 'Reports', icon: Icons.bar_chart_outlined),
      _NavItem(title: 'Settings', icon: Icons.settings_outlined),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: navItems.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          return _buildNavItem(
            title: item.title,
            icon: item.icon,
            isSelected: selectedIndex == index,
            onTap: () => onItemSelected(index),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildNavItem({
    required String title,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue[50] : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: isSelected
            ? Border.all(
                color: Colors.blue.withOpacity(0.3),
                width: 1,
              )
            : null,
      ),
      child: ListTile(
        leading: Icon(
          icon,
          size: 20,
          color: isSelected ? Colors.blue : Colors.grey[700],
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            color: isSelected ? Colors.blue : Colors.grey[700],
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        minLeadingWidth: 0,
        dense: true,
        onTap: onTap,
      ),
    );
  }

  
 

}

class _NavItem {
  final String title;
  final IconData icon;

  _NavItem({required this.title, required this.icon});
}