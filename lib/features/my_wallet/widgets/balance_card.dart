import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient, 
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryGreen.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total Balance',
                style: TextStyle(color: AppColors.white70),
              ),
              const Icon(Icons.credit_card, color: AppColors.white70, size: 20),
            ],
          ),
          const SizedBox(height: 12.0),
          const Text(
            '\$12,847.50',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          const Text(
            '+\$247.50 this month',
            style: TextStyle(color: AppColors.white, fontSize: 14),
          ),
          const SizedBox(height: 24.0),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.account_balance, size: 20),
            label: const Text('Withdraw to Bank'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.white.withOpacity(0.95),
              foregroundColor: AppColors.primaryGreenDark,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}