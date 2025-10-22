import '../../../core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class MessageComposer extends StatelessWidget {
  // Add these lines to accept the parameters
  final TextEditingController controller;
  final VoidCallback onSendPressed;

  const MessageComposer({
    Key? key,
    required this.controller,
    required this.onSendPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(top: BorderSide(color: AppColors.borderColor, width: 1)),
      ),
      child: SafeArea(
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.attach_file, color: AppColors.textBody),
              onPressed: () {},
            ),
            Expanded(
              child: TextField(
                // Use the controller passed from the screen
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Type a message...',
                  filled: true,
                  fillColor: AppColors.lightGrey,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                // Allow sending by pressing 'enter' on the keyboard
                onSubmitted: (_) => onSendPressed(),
              ),
            ),
            const SizedBox(width: 8.0),
            CircleAvatar(
              radius: 22,
              backgroundColor: AppColors.primaryGreen,
              child: IconButton(
                icon: const Icon(Icons.send, color: AppColors.white, size: 20),
                // Use the send function passed from the screen
                onPressed: onSendPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

