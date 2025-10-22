import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart'; 

class SocialShareButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color? color;
  final Gradient? gradient;

  const SocialShareButton({
    Key? key,
    required this.label,
    required this.icon,
    this.color,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color,
            gradient: gradient,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Icon(icon, color: AppColors.white, size: 30), 
        ),
        const SizedBox(height: 8.0),
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
}