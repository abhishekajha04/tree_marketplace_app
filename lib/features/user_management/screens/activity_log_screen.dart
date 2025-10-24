import 'package:flutter/material.dart';
import '../models/activity_model.dart';

class ActivityLogScreen extends StatefulWidget {
  const ActivityLogScreen({super.key});

  @override
  State<ActivityLogScreen> createState() => _ActivityLogScreenState();
}

class _ActivityLogScreenState extends State<ActivityLogScreen> {
  final ScrollController _scrollController = ScrollController();

  // Mock data
  final List<Activity> activities = [
    Activity(
      id: '1',
      userName: 'Sarah Chen',
      userAvatar: 'SC',
      timestamp: '2:30 PM',
      description: 'Completed afternoon feeding session.\nPatient completed meal and finished entire meal',
      tags: ['Feeding', 'Meal'],
      imageUrl: null,
    ),
    Activity(
      id: '2',
      userName: 'Mike Rodriguez',
      userAvatar: 'MR',
      timestamp: '1:15 PM',
      description:
          'Administered prescribed medication.\nPatient was cooperative and no adverse reactions observed.',
      tags: ['Medication'],
      imageUrl: null,
    ),
    Activity(
      id: '3',
      userName: 'Dr. Emily Watson',
      userAvatar: 'EW',
      timestamp: '11:45 AM',
      description:
          'Morning check-up completed. Blood pressure: 120/80, Heart rate: 72 bpm.\nAll vitals within normal range.',
      tags: ['Check-up', 'Vitals'],
      imageUrl: null,
    ),
    Activity(
      id: '4',
      userName: 'James Park',
      userAvatar: 'JP',
      timestamp: '10:30 AM',
      description:
          'Morning hygiene routine completed.\nPatient groomed, bathed and dressed. Activity level participated actively.',
      tags: ['Hygiene'],
      imageUrl: null,
    ),
    Activity(
      id: '5',
      userName: 'Lisa Thompson',
      userAvatar: 'LT',
      timestamp: '9:00 AM',
      description:
          'Physical therapy session completed.\nPatient showed improvement in mobility and balance exercises.',
      tags: ['Therapy'],
      imageUrl: null,
    ),
  ];

  final Map<String, Color> tagColors = {
    'Feeding': const Color(0xFFE8F5E9),
    'Meal': const Color(0xFFE8F5E9),
    'Medication': const Color(0xFFFCE4EC),
    'Check-up': const Color(0xFFF3E5F5),
    'Vitals': const Color(0xFFF3E5F5),
    'Hygiene': const Color(0xFFE0F2F1),
    'Therapy': const Color(0xFFFFEBEE),
  };

  final Map<String, Color> tagTextColors = {
    'Feeding': const Color(0xFF2E7D32),
    'Meal': const Color(0xFF2E7D32),
    'Medication': const Color(0xFFC2185B),
    'Check-up': const Color(0xFF7B1FA2),
    'Vitals': const Color(0xFF7B1FA2),
    'Hygiene': const Color(0xFF00796B),
    'Therapy': const Color(0xFFC62828),
  };

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Activity Log',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Text(
                '${activities.length} updates',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 12 : 24,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date header
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Today, Oct 12',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[800],
                  ),
                ),
              ),
              // Activities list
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  final activity = activities[index];
                  return ActivityCard(
                    activity: activity,
                    tagColors: tagColors,
                    tagTextColors: tagTextColors,
                    isMobile: isMobile,
                  );
                },
              ),
              // Load Previous Days button
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      // Load previous days action
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.expand_more,
                          color: Colors.grey,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Load Previous Days',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new activity action
        },
        backgroundColor: const Color(0xFF42A5F5),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class ActivityCard extends StatelessWidget {
  final Activity activity;
  final Map<String, Color> tagColors;
  final Map<String, Color> tagTextColors;
  final bool isMobile;

  const ActivityCard({
    super.key,
    required this.activity,
    required this.tagColors,
    required this.tagTextColors,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User info row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF42A5F5),
                ),
                child: Center(
                  child: Text(
                    activity.userAvatar,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // User name, timestamp and description
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            activity.userName,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Text(
                          activity.timestamp,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      activity.description,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[700],
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Tags
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: activity.tags
                          .map((tag) => TagPill(
                                tag: tag,
                                backgroundColor: tagColors[tag] ?? Colors.grey[200]!,
                                textColor: tagTextColors[tag] ?? Colors.black87,
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Image placeholder
          if (activity.imageUrl != null || true) // Always show placeholder for now
            Padding(
              padding: EdgeInsets.only(
                left: 52,
                top: 12,
              ),
              child: Container(
                width: double.infinity,
                height: isMobile ? 180 : 220,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: activity.imageUrl != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          activity.imageUrl!,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
              ),
            ),
          const SizedBox(height: 12),
          // Divider
          Padding(
            padding: const EdgeInsets.only(left: 52),
            child: Divider(
              color: Colors.grey[300],
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class TagPill extends StatelessWidget {
  final String tag;
  final Color backgroundColor;
  final Color textColor;

  const TagPill({
    super.key,
    required this.tag,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        tag,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }
}