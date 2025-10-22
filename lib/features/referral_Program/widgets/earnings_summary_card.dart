import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart'; 

class EarningsSummaryCard extends StatelessWidget {
  const EarningsSummaryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Earnings Summary',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textTitle, 
          ),
        ),
        const SizedBox(height: 16.0),
        Row(
          children: [
            _buildStatColumn('12', 'Successful Referrals'),
            const SizedBox(width: 16),
            _buildStatColumn('\$156.50', 'Total Earned'),
          ],
        ),
        const SizedBox(height: 16.0),
        _buildEarningRow('This Month', '\$45.00', AppColors.textTitle), 
        const SizedBox(height: 8.0),
        _buildEarningRow('Pending', '\$12.50', AppColors.darkOrange),
      ],
    );
  }

  Widget _buildStatColumn(String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.textTitle, 
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textBody, 
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildEarningRow(String title, String amount, Color amountColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.textBody, 
            fontSize: 14,
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            color: amountColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}