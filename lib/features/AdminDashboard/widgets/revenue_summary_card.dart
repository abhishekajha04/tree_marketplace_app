import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class RevenueSummaryCard extends StatelessWidget {
  final String value;
  final String change;
  final bool changePositive;

  const RevenueSummaryCard({
    required this.value,
    required this.change,
    required this.changePositive,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Monthly Revenue",
                style: TextStyle(
                  color: Color(0xFFB88200),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              CircleAvatar(
                radius: 16,
                backgroundColor: Color(0xFFFFF1E6), 
                child: Icon(Icons.attach_money, color: Color(0xFFF09C3A), size: 20), 
              ),
            ],
          ),
          const SizedBox(height: 22),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.arrow_upward,
                color: changePositive ? AppColors.primaryGreen : AppColors.error,
                size: 18,
              ),
              Text(
                change,
                style: TextStyle(
                  color: changePositive ? AppColors.primaryGreen : AppColors.error,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
