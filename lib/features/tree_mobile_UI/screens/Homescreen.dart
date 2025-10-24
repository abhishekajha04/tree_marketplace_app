import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:tree_marketplace_app/core/constants/app_colors.dart';
import 'package:tree_marketplace_app/features/tree_mobile_UI/widgets/CustomBottomNavBar.dart';

// --- HomeScreen (Main UI) ---
// This is the main widget that builds the entire screen.
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: _buildAppBar(),
      body: Stack(
        clipBehavior: Clip.none, // Allows the card to "spill out" of the stack
        children: [
          // This is the green header background
          Container(
            height: 80, // Height of the green area below the AppBar
            color: AppColors.primaryGreen,
          ),
          // This Column holds the wallet card and any content that would come below it
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  _buildWalletBalanceCard(),
                  const SizedBox(height: 24),
                  _buildSectionHeader("My Trees", "View All"),
                  const SizedBox(height: 16),
                  _buildMyTreesCard(),
                  const SizedBox(height: 24),
                  _buildSectionHeader("Active Investments", "Manage"),
                  const SizedBox(height: 16),
                  _buildActiveInvestments(),
                  const SizedBox(height: 24),
                  _buildSectionHeader("Quick Actions", null),
                  const SizedBox(height: 16),
                  _buildQuickActions(),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
          // The bottomNavigationBar should NOT be here
        ],
      ),
      // Correct placement for the Bottom Navigation Bar
      bottomNavigationBar: CustomBottomNavBar(
        // <-- MOVED HERE
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  // --- UI Building Methods ---
  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(
        80.0,
      ), // Increased height for better spacing
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryGreen,
        elevation: 0,
        title: Row(
          children: [
            const CircleAvatar(
              // Using a more realistic image URL for demonstration
              backgroundImage: NetworkImage(
                'https://i.pravatar.cc/150?u=a042581f4e29026704d',
              ),
              radius: 24,
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Good morning',
                  style: TextStyle(
                    // Made text lighter but solid white
                    color: Color(0xAAE8F5E9),
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Sarah Johnson',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            // Changed to a solid notification icon
            icon: const Icon(
              Icons.notifications,
              color: AppColors.white,
              size: 28,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }

  // ------------ Wallet Balance Card (Updated) ------------
  Widget _buildWalletBalanceCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20), // More rounded corners
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Wallet Balance',
                style: TextStyle(
                  color: AppColors.textBody,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              // Changed icon to a wallet
              Icon(
                Icons.account_balance_wallet_rounded,
                color: AppColors.primaryGreen,
                size: 28,
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            '\$2,847.50',
            style: TextStyle(
              color: AppColors.textTitle,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: const [
              Icon(Icons.arrow_upward, color: AppColors.primaryGreen, size: 18),
              SizedBox(width: 4),
              Text(
                '+12.5% this month',
                style: TextStyle(
                  color: AppColors.primaryGreen,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.add, size: 20),
                  label: const Text('Buy More'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryGreen,
                    foregroundColor: AppColors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.arrow_forward, size: 20),
                  label: const Text('View'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.lightGrey,
                    foregroundColor: AppColors.textTitle,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, String? actionText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textTitle,
            ),
          ),
          if (actionText != null)
            Text(
              actionText,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryGreen,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMyTreesCard() {
    return Container(
      width: 343,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.lightGreenBackground,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.park, color: AppColors.primaryGreen),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Oak Forest #247',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColors.textTitle,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Planted: March 2024',
                    style: TextStyle(fontSize: 12, color: AppColors.textBody),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    '\$156',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColors.primaryGreen,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Current Value',
                    style: TextStyle(fontSize: 12, color: AppColors.textBody),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: const LinearProgressIndicator(
                    value: 0.8,
                    backgroundColor: AppColors.progressIndicatorBackground,
                    color: AppColors.primaryGreen,
                    minHeight: 6,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                '80% Growth',
                style: TextStyle(fontSize: 12, color: AppColors.textBody),
              ),
            ],
          ),
          const Divider(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatColumn('12', 'Total Trees'),
              _buildStatColumn('2.4 tons', 'CO₂ Offset'),
              _buildStatColumn('\$1,890', 'Total Value'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: AppColors.textTitle,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: AppColors.textBody),
        ),
      ],
    );
  }

  // ------------ Active Investments Section (Parent Widget) ------------
  Widget _buildActiveInvestments() {
    // Use a Column to stack the two separate investment cards
    return Column(
      children: [
        // First Card: Rainforest Restoration
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor.withOpacity(0.08),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: _buildInvestmentTile(
            icon: Icons.spa_rounded,
            iconColor: AppColors.blueIconColor,
            iconBackgroundColor: AppColors.lightBlueBackground,
            title: 'Rainforest Restoration',
            subtitle: 'Monthly Plan',
            amount: '\$50/mo',
            roi: '+8.2% ROI',
          ),
        ),
        const SizedBox(height: 12), // Spacing between the cards
        // Second Card: Carbon Credit Portfolio
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor.withOpacity(0.08),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: _buildInvestmentTile(
            icon: Icons.eco_rounded,
            iconColor: AppColors.primaryGreen,
            iconBackgroundColor: AppColors.lightGreenBackground,
            title: 'Carbon Credit Portfolio',
            subtitle: 'Annual Plan',
            amount: '\$200',
            roi: '+12.4% ROI',
          ),
        ),
      ],
    );
  }

  // ------------ Investment Tile (Reusable Helper - No Changes Needed) ------------
  Widget _buildInvestmentTile({
    required IconData icon,
    required Color iconColor,
    required Color iconBackgroundColor,
    required String title,
    required String subtitle,
    required String amount,
    required String roi,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          // Icon Section
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 28),
          ),
          const SizedBox(width: 12),

          // Title and Subtitle Section
          Expanded(
            child: Column(
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
                  subtitle,
                  style: const TextStyle(
                    color: AppColors.textBody,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          // Amount and ROI Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                amount,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textTitle,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                roi,
                style: const TextStyle(
                  color: AppColors.primaryGreen,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildQuickActionButton(
            icon: Icons.storefront,
            label: 'Marketplace',
            iconColor: AppColors.primaryGreen,
            backgroundColor: AppColors.lightGreenBackground,
          ),
          _buildQuickActionButton(
            icon: Icons.account_balance_wallet,
            label: 'Wallet',
            iconColor: AppColors.blueIconColor,
            backgroundColor: AppColors.lightBlueBackground,
          ),
          _buildQuickActionButton(
            icon: Icons.support_agent,
            label: 'Support',
            iconColor: AppColors.orangeIconColor,
            backgroundColor: AppColors.lightOrangeBackground,
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionButton({
    required IconData icon,
    required String label,
    required Color iconColor,
    required Color backgroundColor,
  }) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: iconColor, size: 28),
            ),
            const SizedBox(height: 12),
            Text(
              label,
              style: const TextStyle(
                color: AppColors.textTitle,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
