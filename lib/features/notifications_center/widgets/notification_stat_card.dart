import 'package:flutter/material.dart';

class NotificationStatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;
  final Color iconColor;

  const NotificationStatCard({
    Key? key,
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      margin: EdgeInsets.symmetric(vertical: 0),
      elevation: 0,
      color: Colors.white,
      child: Container(
        width: 180,
        padding: EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: iconColor, size: 22),
                ),
                Spacer(),
               
              ],
            ),
            SizedBox(height: 12),
            Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
            Text(label, style: TextStyle(color: Colors.grey[800])),
          ],
        ),
      ),
    );
  }
}
