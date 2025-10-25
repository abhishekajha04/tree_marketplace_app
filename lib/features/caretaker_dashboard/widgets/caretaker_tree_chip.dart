import 'package:flutter/material.dart';

class CaretakerTreeChip extends StatelessWidget {
  final String treeType;

  const CaretakerTreeChip({super.key, required this.treeType});

  @override
  Widget build(BuildContext context) {
   
    final int hash = treeType.hashCode;
    final Color color = Color(0xFF000000 + hash % 0xFFFFFF).withOpacity(0.1);
    final Color textColor = Color(0xFF000000 + hash % 0xFFFFFF).withOpacity(0.8);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        treeType,
        style: TextStyle(
          color: textColor,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
