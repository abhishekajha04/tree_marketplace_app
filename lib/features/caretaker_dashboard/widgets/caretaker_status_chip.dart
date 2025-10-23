import 'package:flutter/material.dart';

class CaretakerStatusChip extends StatelessWidget {
  final String status;

  const CaretakerStatusChip({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;

    switch (status) {
      case 'Active':
        backgroundColor = const Color(0xFFE8F5E9); 
        textColor = const Color(0xFF4CAF50); 
        break;
      case 'Away':
        backgroundColor = const Color(0xFFFFF3E0);
        textColor = const Color(0xFFFFB300); 
        break;
      case 'Needs Review':
        backgroundColor = const Color(0xFFFBE8E7); 
        textColor = const Color(0xFFF44336); 
        break;
      default:
        backgroundColor = Colors.grey.shade200;
        textColor = Colors.grey.shade700;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
