import 'package:flutter/material.dart';
import '../widgets/dashboard_stats_card.dart';
import '../widgets/caretaker_search_bar.dart';
import '../widgets/caretaker_table.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_button.dart';


class StatItem {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final Color iconColor;

  const StatItem(this.title, this.value, this.icon, this.color, this.iconColor);
}

class Caretaker {
  final String name;
  final String email;
  final String avatarUrl;
  final int assignedTrees;
  final List<String> treeTypes;
  final int performance;
  final String lastActivity;
  final String status;

  const Caretaker({
    required this.name,
    required this.email,
    required this.avatarUrl,
    required this.assignedTrees,
    required this.treeTypes,
    required this.performance,
    required this.lastActivity,
    required this.status,
  });
}

// --- Main Dashboard Screen ---
class CaretakerDashboardScreen extends StatelessWidget {
  const CaretakerDashboardScreen({super.key});

  final List<StatItem> statItems = const [
    StatItem(
      'Total Caretakers',
      '--',
      Icons.people_alt,
      AppColors.lightBlueBackground, 
      AppColors.blue, 
    ),
    StatItem(
      'Assigned Trees',
      '--',
      Icons.nature_people,
      AppColors.lightGrey, 
      AppColors.primaryGreen,
    ),
    StatItem(
      'Avg Performance',
      '--%',
      Icons.ssid_chart,
      AppColors.lightOrangeBackground, 
      AppColors.orange, 
    ),
    StatItem(
      'Active Tasks',
      '--',
      Icons.format_list_bulleted,
      Color(0xFFF3E5F5), 
      AppColors.purple, 
    ),
  ];

  final List<Caretaker> caretakers = const [
    Caretaker(
      name: 'John Smith',
      email: 'john.smith@email.com',
      avatarUrl: 'https://placehold.co/100x100/42A5F5/FFFFFF/png?text=JS',
      assignedTrees: 67,
      treeTypes: ['Oak', 'Pine', 'Maple'],
      performance: 94,
      lastActivity: '2 hours ago',
      status: 'Active',
    ),
    Caretaker(
      name: 'Sarah Johnson',
      email: 'sarah.johnson@email.com',
      avatarUrl: 'https://placehold.co/100x100/FFB300/FFFFFF/png?text=SJ',
      assignedTrees: 52,
      treeTypes: ['Cherry', 'Birch'],
      performance: 78,
      lastActivity: '5 hours ago',
      status: 'Active',
    ),
    Caretaker(
      name: 'Mike Chen',
      email: 'mike.chen@email.com',
      avatarUrl: 'https://placehold.co/100x100/66BB6A/FFFFFF/png?text=MC',
      assignedTrees: 43,
      treeTypes: ['Willow', 'Elm'],
      performance: 91,
      lastActivity: '1 day ago',
      status: 'Away',
    ),
    Caretaker(
      name: 'Lisa Rodriguez',
      email: 'lisa.rodriguez@email.com',
      avatarUrl: 'https://placehold.co/100x100/AB47BC/FFFFFF/png?text=LR',
      assignedTrees: 58,
      treeTypes: ['Cedar', 'Spruce'],
      performance: 65,
      lastActivity: '3 days ago',
      status: 'Needs Review',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        toolbarHeight: 70,
        title: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 8.0),
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: AppColors.primaryGreen,
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: const Icon(Icons.park, color: AppColors.white),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'TreeCare Manager',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textTitle,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Caretaker Management Dashboard',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textBody,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomButton(
              onPressed: () {},
              icon: Icons.add,
              text: 'Add Caretaker',
              
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=1'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Stats Cards
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 2.5,
              ),
              itemCount: statItems.length,
              itemBuilder: (context, index) {
                final item = statItems[index];
                return DashboardStatsCard(
                  title: item.title,
                  value: item.value,
                  icon: item.icon,
                  backgroundColor: item.color,
                  iconColor: item.iconColor,
                );
              },
            ),

            const SizedBox(height: 32),

            const Text(
              'Caretaker Management',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textTitle,
              ),
            ),

            const SizedBox(height: 16),
            const CaretakerSearchBar(),
            const SizedBox(height: 16),

            CaretakerTable(caretakers: caretakers),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}