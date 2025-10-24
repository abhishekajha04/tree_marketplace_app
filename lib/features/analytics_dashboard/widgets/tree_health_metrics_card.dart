import 'package:flutter/material.dart';

class TreeHealthMetricsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tree Health Metrics',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 14),
            _buildMetricRow(
              'Healthy Trees',
              '89.2%',
              Colors.green,
              Colors.green,
              0.892,
            ),
            SizedBox(height: 12),
            _buildMetricRow(
              'At Risk',
              '7.8%',
              Colors.orange[700]!,
              Colors.orange[300]!,
              0.078,
            ),
            SizedBox(height: 12),
            _buildMetricRow(
              'Critical',
              '3.0%',
              Colors.red,
              Colors.red[300]!,
              0.03,
            ),
            SizedBox(height: 18),
            Divider(),
            SizedBox(height: 18),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.13),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.eco, color: Colors.green, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Overall Health Score',
                        style: TextStyle(
                          color: Colors.green[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Text(
                    '94.2%',
                    style: TextStyle(
                      color: Colors.green[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricRow(
      String label, String value, Color barColor, Color fillColor, double percent) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: TextStyle(color: barColor, fontWeight: FontWeight.w600)),
            Text(value, style: TextStyle(color: barColor, fontWeight: FontWeight.w600)),
          ],
        ),
        SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LinearProgressIndicator(
            value: percent,
            minHeight: 7,
            backgroundColor: Colors.grey[300],
            color: barColor,
          ),
        ),
      ],
    );
  }
}
