import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  // Utility method for creating the info rows (Label on left, Value on right)
  Widget _infoRow(String label, String value, {bool isLink = false}) {
    return Padding(
      // Increased vertical padding slightly to match the image spacing
      padding: const EdgeInsets.symmetric(vertical: 10), 
      child: Row(
        // Pushes the label and value to the opposite sides of the row
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label, 
            style: TextStyle(
              fontSize: 16, // Adjusted font size
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
            )
          ),
          isLink
              ? GestureDetector(
                  onTap: () {
                    // Handle loyalty points tap
                  },
                  child: Text(
                    value,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue[700],
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              : Text(
                  value,
                  style: TextStyle(
                    fontSize: 16, // Adjusted font size
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[800],
                  )
                ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white, // Added white background color here
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          // Align all main content (avatar, name, badge) to the center
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 1. Profile Info (Centered Stack)
            CircleAvatar(
              radius: 40, // Increased size to better match the image
              backgroundImage: NetworkImage(
                'https://i.pravatar.cc/150?img=12'),
            ),
            SizedBox(height: 16), // Spacing below avatar
            
            Text(
              'Sarah Johnson',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 20,
              ),
            ),
            SizedBox(height: 4),
            
            Text(
              'Premium Member',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14, 
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 8),
            
            // Verified Badge
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min, // Ensures the badge itself is centered
                children: [
                  Icon(Icons.verified, color: Colors.green, size: 16),
                  SizedBox(width: 6),
                  Text(
                    'Verified',
                    style: TextStyle(
                      color: Colors.green[800],
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 32), // Creates the large vertical separation before the stats
            
            // 2. Stats section (Must take full width for _infoRow spaceBetween to work)
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  _infoRow('Member Since', 'Jan 2023'),
                  _infoRow('Total Orders', '47'),
                  _infoRow('Total Spent', '\$2,847.50'),
                  _infoRow('Loyalty Points', '1.240', isLink: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
