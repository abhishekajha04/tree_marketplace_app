import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class TreeDashboardScreen extends StatefulWidget {
  final Function(int)? onNavigate;

  const TreeDashboardScreen({
    Key? key,
    this.onNavigate,
  }) : super(key: key);

  @override
  State<TreeDashboardScreen> createState() => _TreeDashboardScreenState();
}

class _TreeDashboardScreenState extends State<TreeDashboardScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(isSmallScreen ? 16.0 : 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tree Dashboard',
                          style: TextStyle(
                            fontSize: isSmallScreen ? 20 : 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textTitle,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '24 trees assigned',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.textBody,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/notifications');
                      },
                      child: CircleAvatar(
                        backgroundColor: AppColors.white,
                        radius: 20,
                         child: Icon(
                          Icons.notifications,
                          color: AppColors.textBody,
                          size: 28,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),

                // Stats Cards
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Healthy',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.textBody,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryGreen.withOpacity(0.1),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    color: AppColors.primaryGreen,
                                    size: 16,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              '18',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryGreen,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Attention',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.textBody,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: AppColors.darkOrange.withOpacity(0.1),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.warning_amber,
                                    color: AppColors.darkOrange,
                                    size: 16,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              '6',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: AppColors.darkOrange,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),

                // Location/Type Filter
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _FilterChip(label: 'Location', selected: true),
                    _FilterChip(label: 'Type', selected: false),
                  ],
                ),
                SizedBox(height: 20),

                // Locations and Trees
                _LocationCard(
                  locationName: 'Central Park',
                  treesCount: '8 trees',
                  healthPercentage: '75%',
                  healthColor: AppColors.primaryGreen,
                  treeData: [
                    TreeData(
                      name: 'Oak #CP001',
                      subtitle: 'Watered 2 days ago',
                      icon: Icons.eco,
                      iconColor: AppColors.primaryGreen,
                      status: 'Healthy',
                    ),
                    TreeData(
                      name: 'Maple #CP002',
                      subtitle: 'Needs watering',
                      icon: Icons.warning_amber,
                      iconColor: AppColors.darkOrange,
                      status: 'Needs attention',
                    ),
                  ],
                ),
                SizedBox(height: 20),

                _LocationCard(
                  locationName: 'Riverside Park',
                  treesCount: '10 trees',
                  healthPercentage: '90%',
                  healthColor: AppColors.primaryGreen,
                  treeData: [
                    TreeData(
                      name: 'Willow #RP001',
                      subtitle: 'Healthy growth',
                      icon: Icons.eco,
                      iconColor: AppColors.primaryGreen,
                      status: 'Healthy',
                    ),
                  ],
                ),
                SizedBox(height: 20),

                _LocationCard(
                  locationName: 'Downtown Area',
                  treesCount: '6 trees',
                  healthPercentage: '50%',
                  healthColor: AppColors.darkOrange,
                  treeData: [
                    TreeData(
                      name: 'Pine #DT001',
                      subtitle: 'Pest issue detected',
                      icon: Icons.priority_high,
                      iconColor: AppColors.error,
                      status: 'Needs attention',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;

  const _FilterChip({required this.label, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? AppColors.primaryGreen.withOpacity(0.1) : AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: selected ? AppColors.primaryGreen : Colors.grey[300]!,
          width: 1.5,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? AppColors.primaryGreen : AppColors.textBody,
          fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
          fontSize: 12,
        ),
      ),
    );
  }
}

class TreeData {
  final String name;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final String status;

  TreeData({
    required this.name,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.status,
  });
}

class _LocationCard extends StatelessWidget {
  final String locationName;
  final String treesCount;
  final String healthPercentage;
  final Color healthColor;
  final List<TreeData> treeData;

  const _LocationCard({
    required this.locationName,
    required this.treesCount,
    required this.healthPercentage,
    required this.healthColor,
    required this.treeData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Location Header
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.primaryGreen.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.location_on,
                        color: AppColors.primaryGreen,
                        size: 20,
                      ),
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          locationName,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textTitle,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          treesCount,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textBody,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: healthColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    healthPercentage,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: healthColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: Colors.grey[200]),

          // Trees List
          ...treeData.asMap().entries.map((entry) {
            int index = entry.key;
            TreeData tree = entry.value;
            bool isLast = index == treeData.length - 1;

            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/tree-update',
                      arguments: {
                        'treeId': tree.name.replaceAll(' ', '_'),
                        'treeName': tree.name,
                        'plantedDate': 'March 15, 2024',
                      },
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: tree.iconColor.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            tree.icon,
                            color: tree.iconColor,
                            size: 18,
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tree.name,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textTitle,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                tree.subtitle,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.textBody,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: tree.iconColor.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            tree.icon,
                            color: tree.iconColor,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (!isLast) Divider(height: 1, color: Colors.grey[200]),
              ],
            );
          }).toList(),

          // View all trees link
          Padding(
            padding: EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'View all ${treesCount.split(' ')[0]} trees',
                  style: TextStyle(
                    color: AppColors.primaryGreen,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}