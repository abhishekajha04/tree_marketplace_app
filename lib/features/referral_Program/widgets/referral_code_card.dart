import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/constants/app_colors.dart';

class ReferralCodeCard extends StatelessWidget {
  final String referralCode;

  const ReferralCodeCard({
    Key? key,
    required this.referralCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: AppColors.primaryGreen,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        children: [
          const Text(
            'Your Referral Code',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 12.0),
          Text(
            referralCode,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton.icon(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: referralCode));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Referral code copied!')),
              );
            },
            icon: const Icon(Icons.copy, size: 16),
            label: const Text('Copy Code'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: AppColors.primaryGreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}