import 'package:flutter/material.dart';
import 'recent_notification_item.dart';

class RecentNotificationsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    final notifs = [
      {
        'type': 'money', 'title': 'Payout Pending Approval', 'desc': 'Your payout of \$2,450.00 is waiting for approval. Please review and confirm.', 'time': '2 min ago', 'badges': ['Review', 'High Priority'], 'color': Colors.red
      },
      {
        'type': 'account', 'title': 'New User Registration', 'desc': 'Sarah Johnson has successfully registered and completed profile verification.', 'time': '15 min ago', 'badges': ['Completed'], 'color': Colors.blue
      },
      {
        'type': 'system', 'title': 'System Update Available', 'desc': 'Version 2.4.1 is now available with security improvements and bug fixes.', 'time': '1 hour ago', 'badges': ['Update Now', 'Recommended'], 'color': Colors.orange
      },
      {
        'type': 'money', 'title': 'Payment Processed', 'desc': 'Payment of \$1,250.00 has been successfully processed to your account.', 'time': '2 hours ago', 'badges': ['Success'], 'color': Colors.green
      },
      {
        'type': 'report', 'title': 'Monthly Report Generated', 'desc': 'Your October analytics report is ready for download.', 'time': '3 hours ago', 'badges': ['Download'], 'color': Colors.grey
      },
    ];
    return Card(
      color: Colors.white,
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Recent Notifications', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 14),
            ...notifs.map((notif) => RecentNotificationItem(notification: notif)),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text('Load More Notifications', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
