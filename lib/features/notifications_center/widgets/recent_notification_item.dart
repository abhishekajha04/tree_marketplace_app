import 'package:flutter/material.dart';

class RecentNotificationItem extends StatelessWidget {
  final Map notification;
  RecentNotificationItem({required this.notification});
  @override
  Widget build(BuildContext context) {
    final color = notification['color'] ?? Colors.blue;
    final badges = notification['badges'] as List<String>;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: color.withOpacity(0.1),
                child: Icon(Icons.notifications, color: color),
                radius: 18,
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(notification['title'], style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(notification['desc'], style: TextStyle(fontSize: 13, color: Colors.grey[800])),
                    Row(
                      children: badges.map((b) => Container(
                        margin: EdgeInsets.only(right: 8, top: 3),
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(b, style: TextStyle(fontSize: 11, color: color, fontWeight: FontWeight.bold)),
                      )).toList(),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8),
              Text(notification['time'], style: TextStyle(fontSize: 12, color: Colors.grey[500])),
            ],
          ),
          Divider(height: 22),
        ],
      ),
    );
  }
}
