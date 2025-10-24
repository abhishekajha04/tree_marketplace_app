import 'package:flutter/material.dart';

// Assuming this file exists from your previous requests
import 'package:tree_marketplace_app/core/constants/app_colors.dart';
import 'package:tree_marketplace_app/features/tree_mobile_UI/widgets/CustomBottomNavBar.dart';

// Enum for timeline item status
enum TimelineStatus { completed, inProgress, upcoming }

class TreeTrackerScreen extends StatefulWidget {
  const TreeTrackerScreen({super.key});

  @override
  State<TreeTrackerScreen> createState() => _TreeTrackerScreenState();
}

class _TreeTrackerScreenState extends State<TreeTrackerScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: AppColors.textTitle),
        title: const Text(
          'Tree Growth Tracker',
          style: TextStyle(
            color: AppColors.textTitle,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: AppColors.textTitle),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: Colors.grey[300], height: 1),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 18),
              _buildHeader(),
              const SizedBox(height: 2),
              _buildGrowthProgress(),
              const SizedBox(height: 2),
              _buildGrowthTimeline(),
              const SizedBox(height: 2),
              _buildCaretakerLogs(),
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

  // ------------ Header Section ------------
  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      height: 125,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey[300]!, width: 1), // top underline
          bottom: BorderSide(
            color: Colors.grey[300]!,
            width: 1,
          ), // bottom underline
        ),
        color: AppColors.white, // optional, to ensure background is white
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.lightGreenBackground,
            child: Icon(Icons.park, color: AppColors.primaryGreen, size: 32),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Oak Tree #247',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textTitle,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Planted: March 15, 2023  •  Height: 2.3m',
                style: TextStyle(fontSize: 14, color: AppColors.textBody),
              ),
              const SizedBox(height: 8),
              Chip(
                label: const Text(
                  'Healthy',
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: AppColors.primaryGreen,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                visualDensity: VisualDensity.compact,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGrowthProgress() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[300]!, width: 1)),
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Growth Progress',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textTitle,
                ),
              ),
              Text(
                'View All',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryGreen,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _progressImage('assets/images/image1.png', 'Mar \'23'),
              _progressImage('assets/images/image2.png', 'Jul \'23'),
              _progressImage('assets/images/image3.png', 'Oct \'23'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _progressImage(String imagePath, String date) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 8,
              left: 8,
              child: Text(
                date,
                style: const TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(color: Colors.black45, blurRadius: 4)],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ------------ Growth Timeline Section ------------
  Widget _buildGrowthTimeline() {
    return Container(
      padding: const EdgeInsets.all(15), // ✅ 10 padding on all sides
      decoration: BoxDecoration(
        color: AppColors.white, // ✅ White background
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[300]!,
            width: 1,
          ), // optional underline
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Growth Timeline',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textTitle,
            ),
          ),
          const SizedBox(height: 16),
          _timelineItem(
            title: 'Germination',
            description: 'First sprout emerged from soil',
            date: 'March 18, 2023',
            status: TimelineStatus.completed,
          ),
          _timelineItem(
            title: 'First Leaves',
            description: 'Initial leaf development phase',
            date: 'April 2, 2023',
            status: TimelineStatus.completed,
          ),
          _timelineItem(
            title: 'Trunk Strengthening',
            description: 'Building structural strength',
            date: 'Expected: Dec 2023',
            status: TimelineStatus.inProgress,
          ),
          _timelineItem(
            title: 'Maturity',
            description: 'Full canopy development',
            date: 'September 2025',
            status: TimelineStatus.upcoming,
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _timelineItem({
    required String title,
    required String description,
    required String date,
    required TimelineStatus status,
    bool isLast = false,
  }) {
    Color statusColor;
    String statusText;

    switch (status) {
      case TimelineStatus.completed:
        statusColor = AppColors.primaryGreen;
        statusText = 'Completed';
        break;
      case TimelineStatus.inProgress:
        statusColor = AppColors.blue; // Using blue for "In Progress"
        statusText = 'In Progress';
        break;
      case TimelineStatus.upcoming:
        statusColor = AppColors.textBody;
        statusText = 'Upcoming';
        break;
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            CircleAvatar(
              radius: 14,
              backgroundColor: status == TimelineStatus.completed
                  ? AppColors.primaryGreen
                  : AppColors.white,
              child: Icon(
                Icons.check,
                size: 16,
                color: status == TimelineStatus.upcoming
                    ? AppColors.borderColor
                    : AppColors.white,
              ),
            ),
            if (!isLast)
              Container(width: 2, height: 60, color: AppColors.borderColor),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textTitle,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: const TextStyle(
                        color: AppColors.textBody,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      date,
                      style: const TextStyle(
                        color: AppColors.textBody,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Text(
                  statusText,
                  style: TextStyle(
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // ------------ Caretaker Logs Section ------------
  Widget _buildCaretakerLogs() {
    return Container(
      padding: const EdgeInsets.all(15), // ✅ 10 padding on all sides
      decoration: BoxDecoration(
        color: AppColors.white, // ✅ White background
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[300]!,
            width: 1,
          ), // optional underline
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Caretaker Logs',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textTitle,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add, size: 18),
                label: const Text('Add Log'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryGreen,
                  foregroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _logEntry(
            name: 'Sarah Johnson',
            timestamp: '2 days ago',
            log:
                'Watered thoroughly and added organic fertilizer. New growth visible on eastern branches. Soil moisture level optimal.',
            tags: {Icons.water_drop: 'Watering', Icons.eco: 'Fertilizing'},
          ),
          _logEntry(
            name: 'Mike Chen',
            timestamp: '1 week ago',
            log:
                'Pruned lower branches and removed dead leaves. Applied pest control treatment. Tree showing excellent health indicators.',
            tags: {Icons.cut: 'Pruning', Icons.bug_report: 'Pest Control'},
          ),
          _logEntry(
            name: 'Emma Davis',
            timestamp: '2 weeks ago',
            log:
                'Monthly health assessment. Canopy height measured at 2.3m, showing 15cm growth since last month. Fruit clusters developing well.',
            tags: {
              Icons.straighten: 'Measurement',
              Icons.health_and_safety: 'Health Check',
            },
          ),
        ],
      ),
    );
  }

  Widget _logEntry({
    required String name,
    required String timestamp,
    required String log,
    required Map<IconData, String> tags,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        padding: const EdgeInsets.all(12), // padding inside the container
        decoration: BoxDecoration(
          color: AppColors.lightGrey, // ✅ light gray background
          borderRadius: BorderRadius.circular(16), // rounded corners
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage('https://i.pravatar.cc/150'),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.textTitle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        timestamp,
                        style: const TextStyle(
                          color: AppColors.textBody,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    log,
                    style: const TextStyle(
                      color: AppColors.textBody,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: tags.entries
                        .map((entry) => _logTag(entry.key, entry.value))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _logTag(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: AppColors.textBody),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(color: AppColors.textBody, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
