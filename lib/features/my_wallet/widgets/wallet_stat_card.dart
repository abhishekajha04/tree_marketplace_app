import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class WalletStatCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String amount;
  final String? tagText;
  final Color? tagColor;
  final Color? tagTextColor;

  const WalletStatCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.amount,
    this.tagText,
    this.tagColor,
    this.tagTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(color: AppColors.borderColor, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, size: 24, color: AppColors.textBody),
                if (tagText != null)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: tagColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      tagText!,
                      style: TextStyle(
                        color: tagTextColor,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12.0),
            Text(title, style: const TextStyle(color: AppColors.textBody)),
            const SizedBox(height: 4.0),
            Text(
              amount,
              style: const TextStyle(
                color: AppColors.textTitle,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}