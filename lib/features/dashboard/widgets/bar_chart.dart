import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../core/constants/app_colors.dart';

class BarChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        borderData: FlBorderData(show: false),
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true, 
              reservedSize: 35, 
              getTitlesWidget: (value, meta) => Text(
                '${value.toInt()}k',
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (double value, TitleMeta meta) {
                const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];
                return Text(
                  months[value.toInt()],
                  style: TextStyle(fontSize: 13),
                );
              },
            ),
          ),
        ),
        barGroups: [
          BarChartGroupData(x: 0, barRods: [
            BarChartRodData(toY: 70, color: AppColors.primaryGreen, width: 18),
            BarChartRodData(toY: 25, color: AppColors.blue, width: 18),
          ], barsSpace: 6),
          BarChartGroupData(x: 1, barRods: [
            BarChartRodData(toY: 75, color: AppColors.primaryGreen, width: 18),
            BarChartRodData(toY: 28, color: AppColors.blue, width: 18),
          ], barsSpace: 6),
          BarChartGroupData(x: 2, barRods: [
            BarChartRodData(toY: 66, color: AppColors.primaryGreen, width: 18),
            BarChartRodData(toY: 22, color: AppColors.blue, width: 18),
          ], barsSpace: 6),
          BarChartGroupData(x: 3, barRods: [
            BarChartRodData(toY: 90, color: AppColors.primaryGreen, width: 18),
            BarChartRodData(toY: 35, color: AppColors.blue, width: 18),
          ], barsSpace: 6),
          BarChartGroupData(x: 4, barRods: [
            BarChartRodData(toY: 97, color: AppColors.primaryGreen, width: 18),
            BarChartRodData(toY: 38, color: AppColors.blue, width: 18),
          ], barsSpace: 6),
          BarChartGroupData(x: 5, barRods: [
            BarChartRodData(toY: 110, color: AppColors.primaryGreen, width: 18),
            BarChartRodData(toY: 40, color: AppColors.blue, width: 18),
          ], barsSpace: 6),
        ],
        groupsSpace: 18,
      ),
    );
  }
}
