import 'package:flutter/material.dart';
import '../widgets/sidebar_navigation.dart';
import '../widgets/notification_stat_card.dart';
import '../widgets/recent_notifications_list.dart';
import '../widgets/quick_actions_card.dart';
import '../widgets/priority_alert_card.dart';
import '../widgets/activity_summary_card.dart';

class NotificationsCenterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8FAFC),
      body: Row(
        children: [
          SidebarNavigation(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Notifications Center",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Stay updated with your latest activities and alerts",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            OutlinedButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                Icons.filter_alt_outlined,
                                color: Colors.grey[800],
                                size: 18,
                              ),
                              label: Text(
                                "Filter",
                                style: TextStyle(color: Colors.grey[800]),
                              ),
                            ),
                            SizedBox(width: 12),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('Mark All Read'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue[600],
                                foregroundColor: Colors.white,
                                textStyle: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 28),
                    // Stat cards row
                    Row(
                      children: [
                        Expanded(
                          child: NotificationStatCard(
                            label: "Total Notifications",
                            value: "24",
                            icon: Icons.notifications,
                            color: Colors.blue[100]!,
                            iconColor: Colors.blue,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: NotificationStatCard(
                            label: "Unread",
                            value: "12",
                            icon: Icons.markunread,
                            color: Colors.orange[50]!,
                            iconColor: Colors.orange,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: NotificationStatCard(
                            label: "Pending Actions",
                            value: "5",
                            icon: Icons.pending_actions,
                            color: Colors.red[50]!,
                            iconColor: Colors.red,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: NotificationStatCard(
                            label: "This Week",
                            value: "18",
                            icon: Icons.calendar_today,
                            color: Colors.green[50]!,
                            iconColor: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 28),
                    // Main content area
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        Expanded(flex: 3, child: RecentNotificationsList()),
                        SizedBox(width: 28),
                        
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              QuickActionsCard(),
                              SizedBox(height: 22),
                              PriorityAlertCard(),
                              SizedBox(height: 22),
                              ActivitySummaryCard(),
                            ],
                          ),
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
