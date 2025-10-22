import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

enum TransactionType { credit, debit }

class TransactionTile extends StatelessWidget {
  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String amount;
  final String date;
  final TransactionType type;

  const TransactionTile({
    Key? key,
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.date,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    final amountColor =
        type == TransactionType.credit ? AppColors.completedGreen : AppColors.errorText; 
    final amountPrefix = type == TransactionType.credit ? '+' : '-';

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: iconBgColor,
        child: Icon(icon, color: iconColor),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.textTitle,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: AppColors.textBody, fontSize: 13),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$amountPrefix\$$amount',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: amountColor,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            date,
            style: const TextStyle(color: AppColors.textBody, fontSize: 12),
          ),
        ],
      ),
    );
  }
}