import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class StatsCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;
  final String change;
  final bool changePositive;

  const StatsCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
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
              Text(label, style: TextStyle(color: color, fontWeight: FontWeight.w600)),
              const Spacer(),
              CircleAvatar(
                radius: 16,
                backgroundColor: color.withOpacity(0.12),
                child: Icon(icon, color: color, size: 20),
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
