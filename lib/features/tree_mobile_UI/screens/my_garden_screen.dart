import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

// Assuming this file exists from your previous requests
import 'package:tree_marketplace_app/core/constants/app_colors.dart';
import 'package:tree_marketplace_app/features/tree_mobile_UI/widgets/CustomBottomNavBar.dart';

// A simple data model for our garden grid items
class GardenItem {
  final String name;
  final IconData icon;
  final Color iconColor;
  final bool isEmpty;

  GardenItem({
    required this.name,
    required this.icon,
    this.iconColor = AppColors.primaryGreenDark,
    this.isEmpty = false,
  });
}

class MyGardenScreen extends StatefulWidget {
  const MyGardenScreen({super.key});

  @override
  State<MyGardenScreen> createState() => _MyGardenScreenState();
}

class _MyGardenScreenState extends State<MyGardenScreen> {
  int _currentIndex = 0;

  // Dummy data for the garden grid
  final List<GardenItem> gardenItems = [
    GardenItem(name: 'Oak', icon: Icons.forest, iconColor: Color(0xFF166534)),
    GardenItem(name: 'Pine', icon: Icons.spa, iconColor: Color(0xFF15803D)),
    GardenItem(name: 'Maple', icon: Icons.park, iconColor: Color(0xFFD97706)),
    GardenItem(name: 'Empty', icon: Icons.add, isEmpty: true),
    GardenItem(name: 'Birch', icon: Icons.eco, iconColor: Color(0xFF65A30D)),
    GardenItem(name: 'Spruce', icon: Icons.forest_outlined, iconColor: Color(0xFF166534)),
    GardenItem(name: 'Willow', icon: Icons.spa_outlined, iconColor: Color(0xFF15803D)),
    GardenItem(name: 'Cherry', icon: Icons.park_outlined, iconColor: Color(0xFFDC2626)),
    GardenItem(name: 'Empty', icon: Icons.add, isEmpty: true),
    GardenItem(name: 'Sapling', icon: Icons.energy_savings_leaf, iconColor: Color(0xFF65A30D)),
    GardenItem(name: 'Apple', icon: Icons.park, iconColor: Color(0xFFEA580C)),
    GardenItem(name: 'Elm', icon: Icons.spa, iconColor: Color(0xFF15803D)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGreenBackground,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              _buildTopStats(),
              const SizedBox(height: 24),
              _buildGardenOverview(),
              const SizedBox(height: 24),
              _buildGrowthStages(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  // ------------ AppBar ------------
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      leading: const Icon(Icons.menu, color: AppColors.textTitle),
      title: const Text(
        'My Garden',
        style: TextStyle(
          color: AppColors.textTitle,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: false,
      actions: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: AppColors.lightOrangeBackground,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.orange.withOpacity(0.5)),
          ),
          child: const Row(
            children: [
              Icon(
                Icons.monetization_on,
                color: AppColors.darkOrange,
                size: 18,
              ),
              SizedBox(width: 4),
              Text(
                '1,245',
                style: TextStyle(
                  color: AppColors.darkOrange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 4),
        IconButton(
          icon: const Icon(Icons.add, color: AppColors.textTitle, size: 28),
          onPressed: () {},
        ),
      ],
    );
  }

  // ------------ Top Stats Section ------------
  Widget _buildTopStats() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor.withOpacity(0.5),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _statItem(
            Icons.eco,
            'Trees',
            '24',
            AppColors.primaryGreen,
            AppColors.iconBackground,
          ),
          _statItem(
            Icons.water_drop,
            'Water',
            '85%',
            AppColors.blue,
            AppColors.lightBlueBackground,
          ),
          _statItem(
            Icons.settings,
            'Energy',
            '92%',
            AppColors.orange,
            AppColors.lightOrangeBackground,
          ),
        ],
      ),
    );
  }

  Widget _statItem(
    IconData icon,
    String label,
    String value,
    Color color,
    Color bgColor,
  ) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: bgColor,
          child: Icon(icon, color: color, size: 28),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: AppColors.textBody)),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: AppColors.textTitle,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  // ------------ Garden Overview Section ------------
  // ------------ Garden Overview Section ------------
  Widget _buildGardenOverview() {
    // Use a Column to stack the header row and the grid container vertically
    return Column(
      children: [
        // 1. This Row contains the header and is now outside the green container
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Garden Overview',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textTitle,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.grid_view_rounded,
                      color: AppColors.textBody,
                    ),
                    visualDensity: VisualDensity.compact,
                  ),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: AppColors.primaryGreenDark,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.inventory_2,
                      color: AppColors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ), // Spacing between header and the grid container
        // 2. This Container now only holds the GridView
        Container(
          height: 290,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.primaryGreen, // Light green background
            borderRadius: BorderRadius.circular(20),
          ),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: gardenItems.length,
            itemBuilder: (context, index) {
              final item = gardenItems[index];
              return item.isEmpty
                  ? _buildEmptyGridItem(item)
                  : _buildGridItem(item);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildGridItem(GardenItem item) {
    return Container(
      height: 300,
      width: 343,
      decoration: BoxDecoration(
        color: AppColors.lightGreenBackground,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor.withOpacity(0.3),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(item.icon, color: item.iconColor, size: 36),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 3,
                backgroundColor: item.iconColor.withOpacity(0.8),
              ),
              const SizedBox(width: 2),
              CircleAvatar(
                radius: 3,
                backgroundColor: item.iconColor.withOpacity(0.5),
              ),
              const SizedBox(width: 2),
              CircleAvatar(
                radius: 3,
                backgroundColor: item.iconColor.withOpacity(0.2),
              ),
            ],
          ),
          const SizedBox(height: 1),
          Text(
            item.name,
            style: const TextStyle(
              color: AppColors.textTitle,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyGridItem(GardenItem item) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(16),
      color: AppColors.primaryGreen.withOpacity(0.5),
      strokeWidth: 10,
      dashPattern: const [8, 4],
      child: SizedBox(
        width: 80, // set desired width
        height: 200, // set desired height
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: AppColors.textBody.withOpacity(0.7),
                  size: 30,
                ),
                const SizedBox(height: 4),
                Text(
                  item.name,
                  style: TextStyle(
                    color: AppColors.textBody.withOpacity(0.8),
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ------------ Growth Stages Section ------------
Widget _buildGrowthStages() {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: AppColors.shadowColor.withOpacity(0.5),
          blurRadius: 15,
          offset: const Offset(0, 5),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Growth Stages',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textTitle,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _legendItem(AppColors.primaryGreen.withOpacity(0.6), 'Seedling'),
            _legendItem(AppColors.primaryGreen, 'Young'),
            _legendItem(AppColors.primaryGreenDark, 'Mature'),
          ],
        ),
      ],
    ),
  );
}

Widget _legendItem(Color color, String label) {
  return Row(
    children: [
      CircleAvatar(radius: 5, backgroundColor: color),
      const SizedBox(width: 8),
      Text(label, style: const TextStyle(color: AppColors.textBody)),
    ],
  );
}

