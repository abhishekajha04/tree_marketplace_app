import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class ChatStatusIndicator extends StatelessWidget {
  final String statusText;

  const ChatStatusIndicator({
    Key? key,
    required this.statusText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightGreenBackground.withOpacity(0.5),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: AppColors.completedGreen,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8.0),
          Text(
            statusText,
            style: const TextStyle(
              color: AppColors.textBody,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
