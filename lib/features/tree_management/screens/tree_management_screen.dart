import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../widgets/tree_card.dart';
import '../widgets/tree_filter_bar.dart';
import '../../../core/widgets/custom_button.dart';

class TreeManagementScreen extends StatelessWidget {
  final List<Map<String, dynamic>> trees = [
    {
      'title': 'Oak Tree',
      'description': 'Majestic shade tree perfect for large landscapes',
      'growth': '15-20 years',
      'price': 85,
      'resale': 250,
      'status': 'Active',
      'image': 'assets/images/oak_tree.png',
    },
    {
      'title': 'Apple Tree',
      'description': 'Productive fruit tree with delicious harvest',
      'growth': '3-5 years',
      'price': 45,
      'resale': 120,
      'status': 'Active',
      'image': 'assets/images/apple_tree.png',
    },
    {
      'title': 'Japanese Maple',
      'description': 'Stunning ornamental tree with vibrant colors',
      'growth': '8-12 years',
      'price': 125,
      'resale': 350,
      'status': 'Low Stock',
      'image': 'assets/images/japanese_maple.png',
    },
    {
      'title': 'Pine Tree',
      'description': 'Hardy evergreen perfect for windbreaks',
      'growth': '10-15 years',
      'price': 65,
      'resale': 180,
      'status': 'Active',
      'image': 'assets/images/pine_tree.png',
    },
    {
      'title': 'Cherry Blossom',
      'description': 'Beautiful flowering tree with spring blooms',
      'growth': '5-8 years',
      'price': 95,
      'resale': 280,
      'status': 'Out of Stock',
      'image': 'assets/images/cherry_blossom.png',
    },
    {
      'title': 'Weeping Willow',
      'description': 'Graceful tree perfect for water features',
      'growth': '6-10 years',
      'price': 75,
      'resale': 220,
      'status': 'Active',
      'image': 'assets/images/weeping_willow.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: Row(
        children: [
          
          Container(
            width: 220,
            color: AppColors.white,
            child: Column(
              children: [
                SizedBox(height: 32),
                Row(
                  children: [
                    SizedBox(width: 20),
                    Icon(Icons.forest, color: AppColors.primaryGreen, size: 32),
                    SizedBox(width: 8),
                    Text(
                      'TreeManager Pro',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textTitle,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32),
                _SidebarButton(
                  icon: Icons.nature,
                  label: 'Tree Management',
                  isSelected: true,
                ),
                _SidebarButton(icon: Icons.bar_chart, label: 'Analytics'),
                _SidebarButton(icon: Icons.local_florist, label: 'Nursery'),
                _SidebarButton(icon: Icons.attach_money, label: 'Sales'),
                _SidebarButton(icon: Icons.settings, label: 'Settings'),
                Spacer(),
               
                Container(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.lightBlueBackground,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  
                ),
              ],
            ),
          ),
          // Main Content
          Expanded(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top Bar
                    Container(
                      color: AppColors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 24,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Tree Management',
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textTitle,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Manage your tree inventory and types',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.textBody,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 16),
                          Container(
                            constraints: BoxConstraints(
                              maxWidth: screenWidth * 0.15,
                              minWidth: 160,
                            ),
                            child: CustomButton(
                              text: 'Add New Tree Type',
                              onPressed: () {},
                              icon: Icons.add,
                              backgroundColor: AppColors.primaryGreen,
                              height: 44,
                              borderRadius: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Filter Bar
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 20,
                      ),
                      child: TreeFilterBar(),
                    ),
                    // Cards Grid
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                         
                          final availableWidth = constraints.maxWidth;
                          final crossAxisCount = availableWidth > 1400 ? 4 : 
                                               availableWidth > 1000 ? 3 : 
                                               availableWidth > 700 ? 2 : 1;
                          
                          return GridView.builder(
                            itemCount: trees.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount,
                              crossAxisSpacing: 24,
                              mainAxisSpacing: 24,
                              childAspectRatio: _getChildAspectRatio(crossAxisCount),
                            ),
                            itemBuilder: (context, index) => TreeCard(tree: trees[index]),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  double _getChildAspectRatio(int crossAxisCount) {
    switch (crossAxisCount) {
      case 1: return 1.8;
      case 2: return 1.1;
      case 3: return 0.95;
      case 4: return 0.85;
      default: return 0.95;
    }
  }
}

class _SidebarButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;

  const _SidebarButton({
    required this.icon,
    required this.label,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.primaryGreen
            : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isSelected ? AppColors.white : Colors.grey[700],
          size: 22,
        ),
        title: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: isSelected ? AppColors.white : Colors.grey[800],
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
        onTap: () {},
        hoverColor: AppColors.lightBlueBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}