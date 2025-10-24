import 'package:flutter/material.dart';
import 'package:tree_marketplace_app/core/constants/app_colors.dart';
import 'package:tree_marketplace_app/core/widgets/custom_button.dart';
// --- App Colors (from your provided code) ---

// --- The Screen Widget ---
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            children: [
              // Top section: Page indicator and Skip button
              _buildTopBar(),
              const SizedBox(height: 32),
              // Image
              _buildImage(),
              const SizedBox(height: 48),
              // Text content
              _buildTextContent(),
              const Spacer(),
              // Continue button
              CustomButton(
                text: 'Continue',
                onPressed: () {
                  // Handle continue button press
                  print('Continue button pressed');
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

 Widget _buildTopBar() {
  return Padding(
    padding: const EdgeInsets.only(left: 25.0), // ✅ Left padding added
    child: Row(
      children: [
        // Centered dots with visual balance
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildDot(isActive: true),
              const SizedBox(width: 8),
              _buildDot(isActive: false),
              const SizedBox(width: 8),
              _buildDot(isActive: false),
            ],
          ),
        ),

        // Skip button aligned right
        TextButton(
          onPressed: () {
            print('Skip button pressed');
          },
          child: const Text(
            'Skip',
            style: TextStyle(
              color: AppColors.textBody,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    ),
  );
}


  Widget _buildDot({required bool isActive}) {
    return Container(
      width: isActive ? 32 : 32,
      height: 4,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryGreen : AppColors.inactiveDot,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24.0),
      child: Image.network(
        'https://images.unsplash.com/photo-1502082553048-f009c37129b9?q=80&w=2070&auto=format&fit=crop',
        height: 320,
        width: 320,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: 320,
            width: 320,
            color: AppColors.lightGrey,
            child: const Center(
              child: Icon(Icons.image_not_supported, color: AppColors.textBody, size: 50),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextContent() {
    return Column(
      children: [
        const Text(
          'Watch Your Trees',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.textTitle,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          'Grow & Thrive',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.primaryGreen,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Invest in real trees and watch them grow through our monitoring system. Each tree is tracked and cared for by local communities.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.textBody,
            fontSize: 18,
            height: 1.5, // Line height
          ),
        ),
      ],
    );
  }
}
