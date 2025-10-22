import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart'; 

class HowItWorksStep extends StatelessWidget {
  final String number;
  final String title;
  final String description;

  const HowItWorksStep({
    Key? key,
    required this.number,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 12,
            backgroundColor: AppColors.primaryGreen,
            child: Text(
              number,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textTitle, 
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  description,
                  style: const TextStyle(
                    color: AppColors.textBody, 
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}