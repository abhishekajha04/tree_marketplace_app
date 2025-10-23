import 'package:flutter/material.dart';
import '../widgets/sidebar_navigation.dart';
import '../widgets/user_growth_trends_chart.dart';
import '../widgets/tree_performance_chart.dart';
import '../widgets/financial_summary_chart.dart';
import '../widgets/caretaker_activity_chart.dart';
import '../widgets/tree_health_metrics_card.dart';

class AnalyticsDashboardScreen extends StatefulWidget {
  @override
  State<AnalyticsDashboardScreen> createState() => _AnalyticsDashboardScreenState();
}

class _AnalyticsDashboardScreenState extends State<AnalyticsDashboardScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: Row(
        children: [
          SidebarNavigation(
            selectedIndex: selectedIndex,
            onItemSelected: (idx) {
              setState(() {
                selectedIndex = idx;
              });
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Top header row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Analytics Dashboard',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Monitor your tree care operations and performance',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[300]!),
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.white, // White background
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                    child: Row(
                                      children: [
                                        Icon(Icons.calendar_today_outlined, size: 16, color: Colors.grey[700]),
                                        SizedBox(width: 6),
                                        Text(
                                          "Last 30 days",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey[700],
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 12),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.green[500],
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                    child: Row(
                                      children: [
                                        Icon(Icons.file_upload, size: 16, color: Colors.white),
                                        SizedBox(width: 6),
                                        Text(
                                          "Export",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 16),
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white, 
                              child: Icon(Icons.person, color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 28),
                    // Top stat cards
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StatCard(
                          icon: Icons.people_outline,
                          value: '2,847',
                          label: 'Active Users',
                          trend: '+12.5%',
                          iconColor: Colors.blue,
                          iconBgColor: Colors.white,
                        ),
                        StatCard(
                          icon: Icons.park_outlined,
                          value: '15,234',
                          label: 'Trees Monitored',
                          trend: '+8.2%',
                          iconColor: Colors.green,
                          iconBgColor: Colors.white,
                        ),
                        StatCard(
                          icon: Icons.attach_money_outlined,
                          value: '\$48,592',
                          label: 'Monthly Revenue',
                          trend: '+15.8%',
                          iconColor: Colors.orange,
                          iconBgColor: Colors.white, 
                        ),
                        StatCard(
                          icon: Icons.health_and_safety_outlined,
                          value: '94.2%',
                          label: 'Tree Health Score',
                          trend: '+22.1%',
                          iconColor: Colors.red,
                          iconBgColor: Colors.white, 
                        ),
                      ],
                    ),
                    SizedBox(height: 28),
                    // Analytics cards
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              UserGrowthTrendsChart(),
                              SizedBox(height: 24),
                              FinancialSummaryChart(),
                            ],
                          ),
                        ),
                        SizedBox(width: 24),
                        
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              TreePerformanceChart(),
                              SizedBox(height: 24),
                              CaretakerActivityChart(),
                            ],
                          ),
                        ),
                        SizedBox(width: 24),
                       
                        Expanded(
                          flex: 1,
                          child: TreeHealthMetricsCard(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final String trend;
  final Color iconColor;
  final Color iconBgColor;

  const StatCard({
    Key? key,
    required this.icon,
    required this.value,
    required this.label,
    required this.trend,
    required this.iconColor,
    required this.iconBgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      color: Colors.white,
      child: Container(
        width: 220,
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, size: 24, color: iconColor),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    trend,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.green[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}