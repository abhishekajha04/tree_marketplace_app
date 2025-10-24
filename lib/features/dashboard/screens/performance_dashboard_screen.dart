import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class PerformanceDashboardScreen extends StatefulWidget {
  final Function(int)? onNavigate;

  const PerformanceDashboardScreen({
    Key? key,
    this.onNavigate,
  }) : super(key: key);

  @override
  State<PerformanceDashboardScreen> createState() =>
      _PerformanceDashboardScreenState();
}

class _PerformanceDashboardScreenState extends State<PerformanceDashboardScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(isMobile ? 16.0 : 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with user profile
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: AppColors.primaryGreen,
                            child: Icon(Icons.person, color: Colors.white),
                          ),
                          SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sarah Johnson',
                                style: TextStyle(
                                  fontSize: isMobile ? 16 : 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textTitle,
                                ),
                              ),
                              Text(
                                'Performance Dashboard',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.textBody,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),

                // Stats Cards - Responsive Grid
                LayoutBuilder(
                  builder: (context, constraints) {
                    bool twoColumn = constraints.maxWidth > 500;
                    return Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        SizedBox(
                          width: twoColumn
                              ? (constraints.maxWidth - 16) / 2
                              : constraints.maxWidth,
                          child: _StatCard(
                            title: 'Updates Done',
                            value: '247',
                            percentage: '+12%',
                            backgroundColor: Color(0xFF2563EB),
                            icon: Icons.check_circle,
                          ),
                        ),
                        SizedBox(
                          width: twoColumn
                              ? (constraints.maxWidth - 16) / 2
                              : constraints.maxWidth,
                          child: _StatCard(
                            title: 'Pending Tasks',
                            value: '1B',
                            percentage: '+3%',
                            backgroundColor: Color(0xFFFB923C),
                            icon: Icons.assignment,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: 24),

                // Overall Rating Section
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Overall Rating',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.textBody,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              ...List.generate(
                                5,
                                (index) => Icon(
                                  Icons.star_rounded,
                                  color: Color(0xFFFBBF24),
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        'This month',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.textBody,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),

                // Performance Metrics Section
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                      Text(
                        'Performance Metrics',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textTitle,
                        ),
                      ),
                      SizedBox(height: 20),
                      _MetricProgressBar(
                        label: 'Task Completion',
                        percentage: 93,
                        color: Color(0xFF10B981),
                      ),
                      SizedBox(height: 16),
                      _MetricProgressBar(
                        label: 'Quality Score',
                        percentage: 87,
                        color: Color(0xFF2563EB),
                      ),
                      SizedBox(height: 16),
                      _MetricProgressBar(
                        label: 'Efficiency',
                        percentage: 91,
                        color: Color(0xFF7C3AED),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),

                // Recent Activity Section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recent Activity',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textTitle,
                      ),
                    ),
                    SizedBox(height: 16),
                    _ActivityItem(
                      icon: Icons.check_circle,
                      iconColor: Color(0xFF10B981),
                      title: 'Completed project review',
                      subtitle: '2 hours ago',
                    ),
                    _ActivityItem(
                      icon: Icons.edit,
                      iconColor: Color(0xFF2563EB),
                      title: 'Updated documentation',
                      subtitle: '4 hours ago',
                    ),
                    _ActivityItem(
                      icon: Icons.star,
                      iconColor: Color(0xFFFBBF24),
                      title: 'Received 5-star rating',
                      subtitle: '1 day ago',
                    ),
                  ],
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String percentage;
  final Color backgroundColor;
  final IconData icon;

  const _StatCard({
    required this.title,
    required this.value,
    required this.percentage,
    required this.backgroundColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: backgroundColor.withOpacity(0.3),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.8),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  percentage,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            value,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _MetricProgressBar extends StatelessWidget {
  final String label;
  final int percentage;
  final Color color;

  const _MetricProgressBar({
    required this.label,
    required this.percentage,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.textBody,
              ),
            ),
            Text(
              '$percentage%',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: percentage / 100,
            minHeight: 8,
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
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
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 20,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textTitle,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  subtitle,
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
    );
  }
}