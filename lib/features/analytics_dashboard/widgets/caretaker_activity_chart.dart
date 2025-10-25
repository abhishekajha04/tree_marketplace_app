import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class CaretakerActivityChart extends StatelessWidget {
  final List<FlSpot> activityData = [
    FlSpot(0, 40),
    FlSpot(1, 50),
    FlSpot(2, 45),
    FlSpot(3, 60),
    FlSpot(4, 58),
    FlSpot(5, 35),
    FlSpot(6, 25),
  ];

  final List<String> weekDays = [
    "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"
  ];

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
            Text('Caretaker Activity', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 16),
            SizedBox(
              height: 170,
              child: LineChart(
                LineChartData(
                  minY: 0,
                  maxY: 75,
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 36,
                        interval: 25,
                        getTitlesWidget: (value, meta) =>
                            Text(value.toInt().toString(), style: TextStyle(fontSize: 12)),
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) =>
                            Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: Text(
                                weekDays[value.toInt()],
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                        interval: 1,
                      ),
                    ),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  gridData: FlGridData(show: true),
                  lineBarsData: [
                    LineChartBarData(
                      spots: activityData,
                      isCurved: true,
                      color: Colors.deepPurpleAccent,
                      barWidth: 3,
                      dotData: FlDotData(show: true),
                      belowBarData: BarAreaData(
                        show: true,
                        color: Colors.deepPurpleAccent.withOpacity(0.15),
                      ),
                    ),
                  ],
                  borderData: FlBorderData(show: false),
                  lineTouchData: LineTouchData(enabled: false),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text('Active Caretakers', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
