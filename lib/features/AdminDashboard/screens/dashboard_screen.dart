import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../widgets/bar_chart.dart';
import '../widgets/revenue_summary_card.dart';
import '../widgets/stats_card.dart';
import '../widgets/sidebar.dart';

import '../../tree_management/screens/tree_management_screen.dart';
import '../../user_management/screens/user_management_screen.dart';
import '../../caretaker_dashboard/screens/caretaker_dashboard_screen.dart';
import '../../Transaction/screens/transaction_screen.dart';
import '../../notifications_center/screens/notifications_center_screen.dart';
import '../../analytics_dashboard/screens/analytics_dashboard_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedIndex = 0;

 
  final List<Widget> pages = [
    DashboardOverviewContent(),
    TreeManagementScreen(),
    UserManagementScreen(),
    CaretakerDashboardScreen(),
    TransactionScreen(),
    AnalyticsDashboardScreen(),
    NotificationsCenterScreen(),
    Center(child: Text('Settings', style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: Row(
        children: [
          Sidebar(
            selectedIndex: selectedIndex,
            onItemSelected: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          Expanded(
            child: pages[selectedIndex],
          ),
        ],
      ),
    );
  }
}

class DashboardOverviewContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Dashboard Overview", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                SizedBox(height: 4),
                Text(
                  "Welcome back, here’s what’s happening with your platform today.",
                  style: TextStyle(color: AppColors.textBody),
                ),
              ],
            ),
            Icon(Icons.notifications_none_rounded, color: AppColors.textBody, size: 28),
          ],
        ),
        SizedBox(height: 32),
        Row(
          children: [
            Expanded(
              child: StatsCard(
                label: "Total Trees Sold",
                value: "###",
                icon: Icons.park,
                color: AppColors.primaryGreen,
                change: "+_% from last month",
                changePositive: true,
              ),
            ),
            SizedBox(width: 24),
            Expanded(
              child: StatsCard(
                label: "Total Users",
                value: "@@@",
                icon: Icons.groups_2,
                color: AppColors.blue,
                change: "+_% from last month",
                changePositive: true,
              ),
            ),
            SizedBox(width: 24),
            Expanded(
              child: StatsCard(
                label: "Active Caretakers",
                value: "%%%",
                icon: Icons.person,
                color: AppColors.purple,
                change: "+_% from last month",
                changePositive: true,
              ),
            ),
            SizedBox(width: 24),
            Expanded(
              child: RevenueSummaryCard(
                value: "\$***",
                change: "+_% from last month",
                changePositive: true,
              ),
            ),
          ],
        ),
        SizedBox(height: 32),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Income vs Payouts", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                          decoration: BoxDecoration(
                            color: AppColors.lightBlueBackground,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.borderColor),
                          ),
                          child: Row(
                            children: [
                              Text("Last 6 months", style: TextStyle(color: AppColors.textBody, fontSize: 14)),
                              Icon(Icons.keyboard_arrow_down, size: 20),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    SizedBox(
                      height: 250,
                      child: BarChartWidget(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 24),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Recent Activities", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    SizedBox(height: 20),
                    _ActivityItem(icon: Icons.park, iconColor: AppColors.primaryGreen, title: "New tree planted", subtitle: "Oak tree planted by Sarah Johnson\n2 minutes ago"),
                    _ActivityItem(icon: Icons.groups_2, iconColor: AppColors.blue, title: "New user registered", subtitle: "Michael Chen joined the platform\n15 minutes ago"),
                    _ActivityItem(icon: Icons.account_balance_wallet, iconColor: AppColors.purple, title: "Payment processed", subtitle: "\$89 payment to caretaker John Doe\n1 hour ago"),
                    _ActivityItem(icon: Icons.update, iconColor: AppColors.orange, title: "Tree update received", subtitle: "New photos from Pine Tree #1847\n3 hours ago"),
                    _ActivityItem(icon: Icons.warning_amber, iconColor: AppColors.red, title: "Alert: Tree needs attention", subtitle: "Maple Tree #2156 requires watering\n5 hours ago"),
                    SizedBox(height: 12),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          "View all activities",
                          style: TextStyle(color: AppColors.primaryGreen, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ActivityItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;

  const _ActivityItem({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: iconColor.withOpacity(0.10),
            child: Icon(icon, size: 18, color: iconColor),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                SizedBox(height: 2),
                Text(subtitle, style: TextStyle(fontSize: 13, color: Colors.grey[700])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
