import 'package:flutter/material.dart';

class QuickActionsCard extends StatelessWidget {
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
            Text('Quick Actions', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            _actionItem(Icons.monetization_on, 'Process Payouts', trailing: '3', color: Colors.red),
            _actionItem(Icons.mark_email_read, 'Mark All Read'),
            _actionItem(Icons.settings, 'Notification Settings'),
          ],
        ),
      ),
    );
  }

  Widget _actionItem(IconData icon, String label, {String? trailing, Color? color}) {
    return ListTile(
      dense: true,
      leading: Icon(icon, color: color ?? Colors.blue),
      title: Text(label),
      trailing: trailing != null
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 2),
              decoration: BoxDecoration(
                color: color?.withOpacity(0.15) ?? Colors.blue.withOpacity(0.15),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(trailing, style: TextStyle(color: color ?? Colors.blue)),
            )
          : null,
    );
  }
}
