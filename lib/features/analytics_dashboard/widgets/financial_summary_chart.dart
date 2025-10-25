import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class FinancialSummaryChart extends StatelessWidget {
  final double revenue = 48592;
  final double expenses = 32148;

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
            Text('Financial Summary', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 16),
            SizedBox(
              height: 150,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      value: revenue,
                      color: Colors.green,
                      radius: 50,
                      showTitle: false,
                    ),
                    PieChartSectionData(
                      value: expenses,
                      color: Colors.blue,
                      radius: 50,
                      showTitle: false,
                    ),
                  ],
                  centerSpaceRadius: 38,
                  sectionsSpace: 2,
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 8),
                Text('Revenue', style: TextStyle(color: Colors.green, fontWeight: FontWeight.w600)),
                Spacer(),
                Text('\$48,592', style: TextStyle(fontWeight: FontWeight.w600)),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 8),
                Text('Expenses', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600)),
                Spacer(),
                Text('\$32,148', style: TextStyle(fontWeight: FontWeight.w600)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
