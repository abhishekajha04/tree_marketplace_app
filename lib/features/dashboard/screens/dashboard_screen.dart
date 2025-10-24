import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_button.dart';
import '../widgets/bar_chart.dart';
import '../widgets/revenue_summary_card.dart';
import '../widgets/stats_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: Row(
        children: [
          // Sidebar
          Container(
            width: 230,
            color: AppColors.white,
            child: Column(
              children: [
                SizedBox(height: 32),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: AppColors.primaryGreen,
                    child: Icon(Icons.park, color: AppColors.white),
                  ),
                  title: Text(
                    "TreeCare\nAdmin",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(height: 24),
                _SidebarTile(selected: true, icon: Icons.dashboard, label: "Dashboard"),
                _SidebarTile(selected: false, icon: Icons.nature, label: "Trees"),
                _SidebarTile(selected: false, icon: Icons.people, label: "Users"),
                _SidebarTile(selected: false, icon: Icons.groups_2, label: "Caretakers"),
                _SidebarTile(selected: false, icon: Icons.attach_money, label: "Finances"),
                _SidebarTile(selected: false, icon: Icons.settings, label: "Settings"),
                Expanded(child: SizedBox()),
              ],
            ),
          ),
          // Main Content
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 24),
              children: [
                // Header
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
                    Row(
                      children: [
                        Icon(Icons.notifications_none_rounded, color: AppColors.textBody, size: 28),
                        SizedBox(width: 24),
                        // CircleAvatar(
                        //   backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/75.jpg'),
                        //   radius: 20,
                        // ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 32),

                // Stats sections
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
                        color: Color(0xFF3952FF),
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
                        color: Color(0xFFC477F0),
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

                // Lower section: Bar chart and Activities
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
                                    color: Color(0xFFF6F9FF),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Color(0xFFE6EEF7)),
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
                            _ActivityItem(icon: Icons.groups_2, iconColor: Color(0xFF3952FF), title: "New user registered", subtitle: "Michael Chen joined the platform\n15 minutes ago"),
                            _ActivityItem(icon: Icons.account_balance_wallet, iconColor: Color(0xFFC477F0), title: "Payment processed", subtitle: "\$89 payment to caretaker John Doe\n1 hour ago"),
                            _ActivityItem(icon: Icons.update, iconColor: Color(0xFFFFA726), title: "Tree update received", subtitle: "New photos from Pine Tree #1847\n3 hours ago"),
                            _ActivityItem(icon: Icons.warning_amber, iconColor: Color(0xFFFF5252), title: "Alert: Tree needs attention", subtitle: "Maple Tree #2156 requires watering\n5 hours ago"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SidebarTile extends StatelessWidget {
  final bool selected;
  final IconData icon;
  final String label;

  const _SidebarTile({required this.selected, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: selected ? AppColors.primaryGreen.withOpacity(0.15) : Colors.transparent,
      child: ListTile(
        leading: Icon(icon, color: selected ? AppColors.primaryGreen : Colors.grey[700]),
        title: Text(label, style: TextStyle(color: selected ? AppColors.primaryGreen : Colors.grey[700])),
        horizontalTitleGap: 8.0,
        contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
        dense: true,
      ),
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
