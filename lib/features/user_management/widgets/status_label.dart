import 'package:flutter/material.dart';

class StatusLabel extends StatelessWidget {
  final String text;
  const StatusLabel({required this.text});

  Color? get bgColor {
    switch (text) {
      case 'Active': return Color(0xFF24C97B);
      case 'Inactive': return Color(0xFFFF5B5B);
      case 'Verified': return Color(0xFF46C878);
      case 'Pending': return Color(0xFFFFA726);
      case 'Rejected': return Color(0xFFFF5B5B);
      default: return Colors.grey[300];
    }
  }

  Color? get textColor {
    switch (text) {
      case 'Active': 
      case 'Verified':
        return Colors.white;
      case 'Pending':
      case 'Inactive':
      case 'Rejected':
        return Colors.white;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 13, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 13),
      ),
    );
  }
}
