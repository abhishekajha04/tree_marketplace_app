import 'package:flutter/material.dart';

class PriorityAlertCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Priority Alerts', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            _alertBox('Critical', '3 payouts require immediate attention', Colors.red[100]!, Colors.red),
            SizedBox(height: 8),
            _alertBox('Pending', 'System update scheduled for tonight', Colors.orange[100]!, Colors.orange),
          ],
        ),
      ),
    );
  }

  Widget _alertBox(String title, String desc, Color bg, Color txt) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(7)),
      child: Row(
        children: [
          Icon(Icons.warning, color: txt, size: 18),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(color: txt, fontWeight: FontWeight.bold)),
                Text(desc, style: TextStyle(color: txt)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
