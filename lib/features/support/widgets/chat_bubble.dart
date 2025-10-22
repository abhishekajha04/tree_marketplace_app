import '../../../core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final String time;
  final bool isSender;
  final String? agentImageUrl;

  const ChatBubble({
    Key? key,
    required this.message,
    required this.time,
    required this.isSender,
    this.agentImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bubbleColor = isSender ? AppColors.primaryGreen : AppColors.lightGrey;
    final textColor = isSender ? AppColors.white : AppColors.textTitle;
    final timeColor = isSender ? AppColors.white70 : AppColors.textBody;

    // Custom border radius for the bubble tail effect
    final borderRadius = isSender
        ? const BorderRadius.only(
            topLeft: Radius.circular(18),
            bottomLeft: Radius.circular(18),
            topRight: Radius.circular(18),
            bottomRight: Radius.circular(4),
          )
        : const BorderRadius.only(
            topLeft: Radius.circular(4),
            bottomLeft: Radius.circular(18),
            topRight: Radius.circular(18),
            bottomRight: Radius.circular(18),
          );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment:
            isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isSender && agentImageUrl != null)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage(agentImageUrl!),
              ),
            ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: bubbleColor,
                borderRadius: borderRadius,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message,
                    style: TextStyle(color: textColor, fontSize: 15, height: 1.4),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    time,
                    style: TextStyle(color: timeColor, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
