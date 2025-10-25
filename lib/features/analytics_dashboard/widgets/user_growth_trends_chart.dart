import 'package:flutter/material.dart';

class UserGrowthTrendsChart extends StatelessWidget {
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
            // Title
            Text(
              'User Growth Trends',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8),
            
            // Toggle buttons
            Row(
              children: [
                _buildToggleButton('Daily', isSelected: true),
                SizedBox(width: 16),
                _buildToggleButton('Weekly', isSelected: false),
                SizedBox(width: 16),
                _buildToggleButton('Monthly', isSelected: false),
              ],
            ),
            SizedBox(height: 16),
            
            // Chart container with grid and data
            Container(
              height: 180,
              child: Stack(
                children: [
                  // Grid lines
                  _buildGridLines(),
                  
                  // Chart lines and data points
                  _buildChartData(),
                  
                  // Y-axis labels
                  _buildYAxisLabels(),
                  
                  // X-axis labels (months)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: _buildXAxisLabels(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildToggleButton(String text, {bool isSelected = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.transparent,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: isSelected ? Colors.white : Colors.grey[600],
          fontSize: 12,
        ),
      ),
    );
  }
  
  Widget _buildGridLines() {
    return Column(
      children: [
        for (int i = 0; i <= 4; i++) ...[
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey[200]!,
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
  
  Widget _buildYAxisLabels() {
    final labels = [3000, 2500, 2000, 1500, 1000, 500, 0];
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: labels.map((value) {
        return Text(
          value == 0 ? '' : value.toString(),
          style: TextStyle(
            fontSize: 10,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        );
      }).toList(),
    );
  }
  
  Widget _buildXAxisLabels() {
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: months.map((month) {
        return Text(
          month,
          style: TextStyle(
            fontSize: 10,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        );
      }).toList(),
    );
  }
  
  Widget _buildChartData() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 8, bottom: 20, top: 8),
      child: Column(
        children: [
          // "Users" label
          Align(
            alignment: Alignment.topRight,
            child: Text(
              'Users',
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 4),
          
          // Legend
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 2,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 4),
                  Text(
                    'New Users',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              SizedBox(width: 12),
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 2,
                    color: Colors.green,
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Active Users',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],
          ),
          
         
          Expanded(
            child: Center(
              child: Text(
                'Line Chart Placeholder',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}