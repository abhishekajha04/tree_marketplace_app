import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class RecentReferralTile extends StatelessWidget {
  final String name;
  final String date;
  final String amount;
  final String status;
  final String imageUrl;

  const RecentReferralTile({
    Key? key,
    required this.name,
    required this.date,
    required this.amount,
    required this.status,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusColor = status == 'Completed'
        ? AppColors.completedGreen
        : AppColors.darkOrange; 

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(imageUrl), 
        ),
        title: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.textTitle, 
          ),
        ),
        subtitle: Text(
          date,
          style: const TextStyle(
            color: AppColors.textBody, 
            fontSize: 12,
          ),
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              amount,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.textTitle, 
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              status,
              style: TextStyle(
                color: statusColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}