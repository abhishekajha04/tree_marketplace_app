import 'package:flutter/material.dart';

class ActivitySummaryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Today's Activity", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            _activityRow('New notifications', '8'),
            _activityRow('Actions completed', '12'),
            _activityRow('Pending items', '5'),
            Divider(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Completion rate', style: TextStyle(fontWeight: FontWeight.w500)),
                Text('85%', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _activityRow(String label, String value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label),
            Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      );
}
