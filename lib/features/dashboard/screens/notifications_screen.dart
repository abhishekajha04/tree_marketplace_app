import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  String _selectedTab = 'All';
  final List<String> _tabs = ['All', 'Unread', 'Important'];

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: EdgeInsets.all(isSmallScreen ? 16.0 : 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back,
                          color: AppColors.textTitle,
                          size: 24,
                        ),
                      ),
                      SizedBox(width: 12),
                      Text(
                        'Notifications',
                        style: TextStyle(
                          fontSize: isSmallScreen ? 20 : 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textTitle,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.more_vert,
                      color: AppColors.textTitle,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),

            // Tab Navigation
            Padding(
              padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 16.0 : 20.0),
              child: Row(
                children: _tabs.map((tab) {
                  final isSelected = _selectedTab == tab;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedTab = tab;
                        });
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              tab,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                                color: isSelected ? AppColors.primaryGreen : AppColors.textBody,
                              ),
                            ),
                          ),
                          if (isSelected)
                            Container(
                              height: 3,
                              decoration: BoxDecoration(
                                color: AppColors.primaryGreen,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Divider(height: 1, color: AppColors.borderColor),

            // Notifications List
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(isSmallScreen ? 16.0 : 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Due Updates Section
                      _NotificationSection(
                        title: 'Due Updates',
                        notifications: [
                          _NotificationItem(
                            icon: Icons.description,
                            iconColor: Color(0xFFDC2626),
                            title: 'Project Status Report',
                            description: 'Weekly status report for Q4 project',
                            badge: 'Overdue',
                            badgeColor: Color(0xFFDC2626),
                            time: '3 days overdue',
                            action: 'Submit Now',
                            actionColor: AppColors.primaryGreen,
                          ),
                          _NotificationItem(
                            icon: Icons.assessment,
                            iconColor: Color(0xFFEA580C),
                            title: 'Team Performance Review',
                            description: 'Quarterly performance evaluations for your team members.',
                            badge: 'Due Today',
                            badgeColor: Color(0xFFEA580C),
                            time: 'Due Oct 31, 2024',
                            action: 'View',
                            actionColor: Color(0xFFEA580C),
                          ),
                        ],
                      ),
                      SizedBox(height: 24),

                      // New Assignments Section
                      _NotificationSection(
                        title: 'New Assignments',
                        notifications: [
                          _NotificationItem(
                            icon: Icons.person_add,
                            iconColor: Color(0xFF3B82F6),
                            title: 'Lead Designer',
                            description: 'You\'ve been assigned as lead designer for the new interface project.',
                            assignee: 'Sarah Chen',
                            badge: 'Pending',
                            badgeColor: Color(0xFF3B82F6),
                            time: 'Now',
                            action: 'Accept',
                            actionColor: AppColors.primaryGreen,
                          ),
                          _NotificationItem(
                            icon: Icons.check_circle,
                            iconColor: AppColors.primaryGreen,
                            title: 'Client Presentation Prep',
                            description: 'Prepare slides for the upcoming client presentation.',
                            assignee: 'Mike Johnson',
                            badge: '',
                            badgeColor: AppColors.primaryGreen,
                            time: '2h ago',
                            action: 'View Details',
                            actionColor: AppColors.primaryGreen,
                          ),
                        ],
                      ),
                      SizedBox(height: 24),

                      // Admin Alerts Section
                      _NotificationSection(
                        title: 'Admin Alerts',
                        notifications: [
                          _NotificationItem(
                            icon: Icons.lock,
                            iconColor: Color(0xFFA855F7),
                            title: 'Security Update Required',
                            description: 'Please update your password and enable two-factor authentication by end of week.',
                            assignee: 'IT Security Team',
                            badge: 'Critical',
                            badgeColor: Color(0xFFA855F7),
                            time: '1h ago',
                            action: 'Update Now',
                            actionColor: Color(0xFFA855F7),
                          ),
                          _NotificationItem(
                            icon: Icons.calendar_today,
                            iconColor: Color(0xFFF59E0B),
                            title: 'Holiday Schedule',
                            description: 'Company holidays schedule updated for end of year review and planning accordingly.',
                            assignee: 'HR Department',
                            badge: '',
                            badgeColor: Color(0xFFF59E0B),
                            time: '2h ago',
                            action: 'View Schedule',
                            actionColor: Color(0xFFF59E0B),
                          ),
                          _NotificationItem(
                            icon: Icons.build,
                            iconColor: Color(0xFF6B7280),
                            title: 'System Maintenance',
                            description: 'Scheduled system maintenance window this Tuesday from 2-4 PM.',
                            assignee: 'System Admin',
                            badge: '',
                            badgeColor: Color(0xFF6B7280),
                            time: '5h ago',
                            action: 'Dismiss',
                            actionColor: Color(0xFF6B7280),
                          ),
                        ],
                      ),
                      SizedBox(height: 24),

                      // Earlier Section
                      _NotificationSection(
                        title: 'Earlier',
                        notifications: [
                          _NotificationItem(
                            icon: Icons.done,
                            iconColor: Color(0xFF10B981),
                            title: 'Task Completed',
                            description: 'Monthly report has been successfully completed.',
                            badge: '',
                            badgeColor: Color(0xFF10B981),
                            time: '3 days ago',
                            action: '',
                            actionColor: Colors.transparent,
                          ),
                          _NotificationItem(
                            icon: Icons.groups,
                            iconColor: Color(0xFF8B5CF6),
                            title: 'Team Meeting',
                            description: 'Weekly standup has been completed. Notes available in shared folder.',
                            badge: '',
                            badgeColor: Color(0xFF8B5CF6),
                            time: '5 days ago',
                            action: '',
                            actionColor: Colors.transparent,
                          ),
                        ],
                      ),
                      SizedBox(height: 24),

                      // Mark All as Read Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryGreen,
                            padding: EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            '✓ Mark All as Read',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NotificationSection extends StatelessWidget {
  final String title;
  final List<_NotificationItem> notifications;

  const _NotificationSection({
    required this.title,
    required this.notifications,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.textBody,
            letterSpacing: 0.5,
          ),
        ),
        SizedBox(height: 12),
        ...notifications.map((notification) {
          return _NotificationCard(notification: notification);
        }).toList(),
      ],
    );
  }
}

class _NotificationCard extends StatelessWidget {
  final _NotificationItem notification;

  const _NotificationCard({required this.notification});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
      decoration: BoxDecoration(
        color: notification.iconColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: notification.iconColor.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: notification.iconColor.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  notification.icon,
                  color: notification.iconColor,
                  size: 18,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            notification.title,
                            style: TextStyle(
                              fontSize: isSmallScreen ? 13 : 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textTitle,
                            ),
                          ),
                        ),
                        if (notification.badge.isNotEmpty)
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: notification.badgeColor.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              notification.badge,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: notification.badgeColor,
                              ),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: 6),
                    Text(
                      notification.description,
                      style: TextStyle(
                        fontSize: isSmallScreen ? 12 : 13,
                        color: AppColors.textBody,
                        height: 1.4,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (notification.assignee.isNotEmpty)
                      Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 12,
                              backgroundColor: notification.iconColor.withOpacity(0.2),
                              child: Icon(
                                Icons.person,
                                size: 10,
                                color: notification.iconColor,
                              ),
                            ),
                            SizedBox(width: 6),
                            Text(
                              notification.assignee,
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.textBody,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                notification.time,
                style: TextStyle(
                  fontSize: 11,
                  color: AppColors.textBody.withOpacity(0.7),
                ),
              ),
              if (notification.action.isNotEmpty)
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    backgroundColor: notification.actionColor.withOpacity(0.1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Text(
                    notification.action,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: notification.actionColor,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NotificationItem {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String description;
  final String badge;
  final Color badgeColor;
  final String time;
  final String action;
  final Color actionColor;
  final String assignee;

  _NotificationItem({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.description,
    required this.badge,
    required this.badgeColor,
    required this.time,
    required this.action,
    required this.actionColor,
    this.assignee = '',
  });
}