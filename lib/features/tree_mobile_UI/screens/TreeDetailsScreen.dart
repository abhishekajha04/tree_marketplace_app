import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// Assuming your AppColors and CustomButton are in these locations
import 'package:tree_marketplace_app/core/constants/app_colors.dart';
import 'package:tree_marketplace_app/core/widgets/custom_button.dart';

class TreeDetailsScreen extends StatelessWidget {
  const TreeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Make top status bar icons dark
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: AppColors.textTitle),
        centerTitle: true,
        title: const Text(
          'Tree Details',
          style: TextStyle(
            color: AppColors.textTitle,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: AppColors.textBody),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageHeader(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitleAndPrice(),
                  const SizedBox(height: 24),
                  _buildTreeStats(),
                  const SizedBox(height: 30),
                  const Divider(),
                  const SizedBox(height: 30),
                  _buildGrowthStages(),
                  const SizedBox(height: 30),
                  _buildEstimatedValue(),
                  const SizedBox(height: 30),
                  _buildTreeFeatures(),
                  const SizedBox(height: 30),
                  _buildLocationAndCare(),
                  const SizedBox(height: 120), // Extra space for bottom bar
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomCtaBar(context),
    );
  }

  // ------------------ Image Header ------------------
  Widget _buildImageHeader() {
    return Stack(
      children: [
        Image.asset(
          'assets/images/section.png', // Make sure this path is correct in your project
          height: 400,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 14,
          right: -1,
          child: Chip(
            label: const Text(
              'Premium',
              style: TextStyle(color: AppColors.primaryGreen),
            ),
            backgroundColor: AppColors.white.withOpacity(0.8),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          ),
        ),
      ],
    );
  }

  // ------------------ Title & Price ------------------
  Widget _buildTitleAndPrice() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'European Oak Tree',
          style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.textTitle),
        ),
        const SizedBox(height: 8),
        const Text(
          'Quercus robur • Age: 5 years',
          style: TextStyle(fontSize: 16, color: AppColors.textBody),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                '\$2,850',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryGreen,
                ),
              ),
              const SizedBox(width: 100),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.lightGreenBackground,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  '📈 +15% growth',
                  style: TextStyle(
                    color: AppColors.primaryGreen,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  // ------------------ Tree Stats ------------------
  Widget _buildTreeStats() {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _statItem('15m', 'Height'),
          const VerticalDivider(),
          _statItem('6m', 'Spread'),
          const VerticalDivider(),
          _statItem('150yr', 'Lifespan'),
        ],
      ),
    );
  }

  Widget _statItem(String value, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textTitle),
          ),
          const SizedBox(height: 4),
          Text(label,
              style: const TextStyle(fontSize: 14, color: AppColors.textBody)),
        ],
      ),
    );
  }

  // ------------------ Growth Stages ------------------
  Widget _buildGrowthStages() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Growth Stages',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.textTitle,
          ),
        ),
        const SizedBox(height: 24),
        _growthStageItem(
          icon: Icons.spa_rounded,
          title: 'Sapling',
          years: '0-2 years',
          progress: 1.0,
          isComplete: true,
        ),
        const SizedBox(height: 20),
        _growthStageItem(
          icon: Icons.park_rounded,
          title: 'Young Tree',
          years: '2-10 years',
          progress: 0.6,
          isActive: true,
        ),
        const SizedBox(height: 20),
        _growthStageItem(
          icon: Icons.forest_rounded,
          title: 'Mature Tree',
          years: '10-50 years',
          progress: 0.0,
        ),
      ],
    );
  }

  Widget _growthStageItem({
    required IconData icon,
    required String title,
    required String years,
    required double progress,
    bool isComplete = false,
    bool isActive = false,
  }) {
    final bool isHighlighted = isComplete || isActive;
    final Color circleColor =
        isHighlighted ? AppColors.lightGreenBackground : AppColors.lightGrey;
    final Color iconColor =
        isHighlighted ? AppColors.primaryGreen : AppColors.textBody;
    final Color textColor =
        isHighlighted ? AppColors.textTitle : AppColors.textBody;
    final Color progressColor =
        isHighlighted ? AppColors.primaryGreen : AppColors.borderColor;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: circleColor,
          child: Icon(icon, color: iconColor, size: 26),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: textColor)),
                  Text(years,
                      style: TextStyle(
                          fontSize: 14,
                          color: textColor,
                          fontWeight: FontWeight.w500)),
                ],
              ),
              const SizedBox(height: 12),
              LinearProgressIndicator(
                value: progress,
                backgroundColor: AppColors.borderColor,
                valueColor: AlwaysStoppedAnimation<Color>(progressColor),
                minHeight: 8,
                borderRadius: BorderRadius.circular(4),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ------------------ Estimated Resale Value ------------------
  Widget _buildEstimatedValue() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Estimated Resale Value',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.textTitle,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              colors: [
                AppColors.lightGreenBackground,
                AppColors.white.withOpacity(0.5),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: _valueColumn('5 Years', '\$3,200', '+12% growth')),
                  Expanded(child: _valueColumn('10 Years', '\$4,850', '+70% growth')),
                ],
              ),
              const SizedBox(height: 4),
              Divider(color: AppColors.primaryGreen.withOpacity(0.2)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    '20 Year Projection',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.textBody,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  _valueColumn('', '\$8,500', '+198% total growth',
                      isProjection: true),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _valueColumn(String title, String value, String growth,
      {bool isProjection = false}) {
    final alignment =
        isProjection ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    return Column(
      crossAxisAlignment: alignment,
      children: [
        if (title.isNotEmpty)
          Text(title,
              style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textBody,
                  fontWeight: FontWeight.w500)),
        if (title.isNotEmpty) const SizedBox(height: 4),
        Text(value,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryGreenDark)),
        const SizedBox(height: 2),
        Text(growth,
            style: const TextStyle(
                fontSize: 14,
                color: AppColors.primaryGreenDark,
                fontWeight: FontWeight.w500)),
      ],
    );
  }

  // ------------------ Tree Features ------------------
  Widget _buildTreeFeatures() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tree Features',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.textTitle,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
                child: _featureChip(
                    icon: Icons.eco_rounded,
                    label: 'Deciduous',
                    iconColor: AppColors.primaryGreen)),
            const SizedBox(width: 14),
            Expanded(
                child: _featureChip(
                    icon: Icons.ac_unit_rounded,
                    label: 'Cold Hardy',
                    iconColor: AppColors.blue)),
          ],
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            Expanded(
                child: _featureChip(
                    icon: Icons.wb_sunny_rounded,
                    label: 'Full Sun',
                    iconColor: AppColors.orange)),
            const SizedBox(width: 14),
            Expanded(
                child: _featureChip(
                    icon: Icons.water_drop_rounded,
                    label: 'Moderate Water',
                    iconColor: AppColors.blueIconColor)),
          ],
        ),
      ],
    );
  }

  Widget _featureChip(
      {required IconData icon,
      required String label,
      required Color iconColor}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 24),
          const SizedBox(width: 12),
          Text(label,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: AppColors.textTitle)),
        ],
      ),
    );
  }

  // ------------------ Location & Care ------------------
  Widget _buildLocationAndCare() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Location & Care',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textTitle)),
        const SizedBox(height: 16),
        _careItem(Icons.location_on_outlined, 'Sustainable Forest, Oregon'),
        _careItem(
            Icons.energy_savings_leaf_outlined, 'Professional care included'),
        _careItem(Icons.verified_outlined, 'FSC Certified sustainable'),
      ],
    );
  }

  Widget _careItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primaryGreen, size: 24),
          const SizedBox(width: 16),
          Text(text,
              style: const TextStyle(fontSize: 16, color: AppColors.textBody)),
        ],
      ),
    );
  }

  // ------------------ Bottom CTA Bar ------------------
  Widget _buildBottomCtaBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          20, 10, 20, MediaQuery.of(context).padding.bottom + 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(top: BorderSide(color: AppColors.borderColor, width: 1)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: 'Buy Now - \$2,850',
                  onPressed: () {},
                ),
              ),
              const SizedBox(width: 16),
              IconButton(
                  icon:
                      const Icon(Icons.share_outlined, size: 28, color: AppColors.textBody),
                  onPressed: () {}),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Free shipping • 90-day money-back guarantee',
            style: TextStyle(color: AppColors.textBody, fontSize: 12),
          ),
        ],
      ),
    );
  }
}