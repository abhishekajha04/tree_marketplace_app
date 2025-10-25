import 'package:flutter/material.dart';
import '../screens/caretaker_dashboard_screen.dart'; 

class CaretakerActionButtons extends StatelessWidget {
  final Caretaker caretaker;

  const CaretakerActionButtons({super.key, required this.caretaker});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
       
        TextButton(
          onPressed: () {
            debugPrint('Assign Trees to ${caretaker.name}');
          },
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFF24C97B), 
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add, size: 16),
              SizedBox(width: 4),
              Text(
                'Assign Trees',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),

        
        TextButton(
          onPressed: () {
            debugPrint('Remove Trees from ${caretaker.name}');
          },
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFFFF5252), 
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.delete_outline, size: 16),
              SizedBox(width: 4),
              Text(
                'Remove Trees',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}