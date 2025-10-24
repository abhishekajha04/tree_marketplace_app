import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Assuming this file exists from your previous request
import 'package:tree_marketplace_app/core/constants/app_colors.dart';
import 'package:tree_marketplace_app/features/tree_mobile_UI/widgets/CustomBottomNavBar.dart';

// Enum to manage the status and color of the tree chips
enum TreeStatus { growing, mature, young, harvested }

class MyTreesScreen extends StatefulWidget {
  const MyTreesScreen({super.key});

  @override
  State<MyTreesScreen> createState() => _MyTreesScreenState();
}

class _MyTreesScreenState extends State<MyTreesScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
    );

    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        backgroundColor: AppColors.primaryGreen,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () {},
        ),
        title: const Text(
          'My Trees',
          style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt, color: AppColors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          // Green background that extends from the AppBar
          Container(height: 100, color: AppColors.primaryGreen),
          SingleChildScrollView(
            child: Column(
              children: [
                _buildHeader(),
                _buildStatsCard(),
                const SizedBox(height: 24),
                _buildFilterChips(),
                const SizedBox(height: 16),
                _buildTreeList(),
              ],
            ),
          ),
        ],
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

  // ------------ Header (Portfolio Value) ------------
  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      color: AppColors.primaryGreen,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Total Trees Value',
            style: TextStyle(color: AppColors.white70, fontSize: 16),
          ),
          const SizedBox(height: 4),
          const Text(
            '\$24,580',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            '+12.5% this month',
            style: TextStyle(color: AppColors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }

  // ------------ Stats Card (Active Trees, Profit, Growth) ------------
  Widget _buildStatsCard() {
    return Container(
      width: double.infinity,
      // margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,

        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor.withOpacity(0.5),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _statItem('47', 'Active Trees'),
          _statItem('\$3,240', 'Est. Profit'),
          _statItem('89%', 'Avg Growth'),
        ],
      ),
    );
  }

  Widget _statItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.textTitle,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: AppColors.textBody, fontSize: 14),
        ),
      ],
    );
  }

  // ------------ Filter Chips ------------
  Widget _buildFilterChips() {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          _filterChip('All', isActive: true),
          _filterChip('Growing'),
          _filterChip('Mature'),
          _filterChip('Harvested'),
        ],
      ),
    );
  }

  Widget _filterChip(String label, {bool isActive = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 6),
      child: Chip(
        label: Text(
          label,
          style: TextStyle(
            color: isActive ? AppColors.white : AppColors.textBody,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: isActive
            ? AppColors.primaryGreenDark
            : AppColors.white,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: isActive
                ? AppColors.primaryGreenDark
                : AppColors.borderColor,
          ),
        ),
      ),
    );
  }

  // ------------ Tree List ------------
  Widget _buildTreeList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _buildTreeCard(
            icon: Icons.park_rounded,
            name: 'Oak Tree #OT-2401',
            date: 'Planted: Mar 15, 2024',
            status: TreeStatus.growing,
            progress: 0.78,
            investment: '\$520',
            estValue: '\$680',
            profit: '+\$160',
            gps: '40.7128, -74.0060',
          ),
          _buildTreeCard(
            icon: Icons.forest_rounded,
            name: 'Pine Tree #PT-2398',
            date: 'Planted: Jan 22, 2024',
            status: TreeStatus.mature,
            progress: 1.0,
            investment: '\$750',
            estValue: '\$1,200',
            profit: '+\$450',
            gps: '41.8781, -87.6298',
          ),
          _buildTreeCard(
            icon: Icons.park_outlined,
            name: 'Maple Tree #MT-2385',
            date: 'Planted: Feb 08, 2024',
            status: TreeStatus.young,
            progress: 0.45,
            investment: '\$380',
            estValue: '\$420',
            profit: '+\$40',
            gps: '34.0522, -118.2437',
          ),
          _buildTreeCard(
            icon: Icons.spa_rounded,
            name: 'Birch Tree #BT-2372',
            date: 'Planted: Apr 03, 2024',
            status: TreeStatus.growing,
            progress: 0.62,
            investment: '\$290',
            estValue: '\$350',
            profit: '+\$60',
            gps: '39.9526, -75.1652',
          ),
        ],
      ),
    );
  }

  // ------------ Individual Tree Card Widget ------------
  Widget _buildTreeCard({
    required IconData icon,
    required String name,
    required String date,
    required TreeStatus status,
    required double progress,
    required String investment,
    required String estValue,
    required String profit,
    required String gps,
  }) {
    // --- Determine status chip properties ---
    String statusText;
    Color statusColor;
    Color statusTextColor = AppColors.white;

    switch (status) {
      case TreeStatus.growing:
        statusText = 'Growing';
        statusColor = AppColors.primaryGreen.withOpacity(0.8);
        break;
      case TreeStatus.mature:
        statusText = 'Mature';
        statusColor = AppColors.primaryGreenDark;
        break;
      case TreeStatus.young:
        statusText = 'Young';
        statusColor = AppColors.orange;
        break;
      case TreeStatus.harvested:
        statusText = 'Harvested';
        statusColor = AppColors.textBody;
        break;
    }

    return Card(
      color: AppColors.white,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      shadowColor: AppColors.shadowColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Top Section: Icon, Name, Status ---
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: AppColors.lightGreenBackground,
                  child: Icon(icon, color: AppColors.primaryGreen, size: 28),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textTitle,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        date,
                        style: const TextStyle(
                          color: AppColors.textBody,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Chip(
                  label: Text(
                    statusText,
                    style: TextStyle(
                      color: statusTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  backgroundColor: statusColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // --- Middle Section: Progress Bar ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Growth Progress',
                  style: TextStyle(color: AppColors.textBody),
                ),
                Text(
                  '${(progress * 100).toInt()}%',
                  style: const TextStyle(
                    color: AppColors.textTitle,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: AppColors.borderColor,
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.primaryGreen,
              ),
              minHeight: 8,
              borderRadius: BorderRadius.circular(4),
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),

            // --- Financials Section ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _financialItem('Investment', investment),
                _financialItem('Est. Value', estValue),
                _financialItem('Profit', profit, isProfit: true),
              ],
            ),
            const SizedBox(height: 16),

            // --- Bottom Section: GPS & Action ---
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: AppColors.textBody,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  'GPS: $gps',
                  style: const TextStyle(
                    color: AppColors.textBody,
                    fontSize: 12,
                  ),
                ),
                const Spacer(),
                Text(
                  status == TreeStatus.mature
                      ? 'Harvest Ready'
                      : 'View Details',
                  style: const TextStyle(
                    color: AppColors.primaryGreenDark,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _financialItem(String label, String value, {bool isProfit = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: AppColors.textBody, fontSize: 12),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: isProfit ? AppColors.primaryGreen : AppColors.textTitle,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
