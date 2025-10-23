import 'package:flutter/material.dart';

class ProfilePayoutRequests extends StatelessWidget {
 final List<Map<String, String>> requests = const [
  {'amount': '\$250.00', 'date': 'Oct 18, 2024', 'completionDate': 'Oct 22, 2024', 'status': 'Processing'},
  {'amount': '\$180.50', 'date': 'Oct 10, 2024', 'completionDate': 'Oct 12, 2024', 'status': 'Completed'},
  {'amount': '\$350.00', 'date': 'Sep 25, 2024', 'completionDate': 'Sep 28, 2024', 'status': 'Completed'},
];

  // Utility method to build each individual payout request card
  Widget _buildRequestCard(Map<String, String> request) {
    final String status = request['status'] ?? '';
    Color statusBgColor;
    Color statusFgColor;
    
    // Set colors based on status
    if (status == 'Completed') {
      statusBgColor = Colors.green[100]!;
      statusFgColor = Colors.green[800]!;
    } else if (status == 'Processing') {
      statusBgColor = Colors.yellow[100]!;
      statusFgColor = Colors.yellow[800]!;
    } else { // Default/Other status
      statusBgColor = Colors.grey[100]!;
      statusFgColor = Colors.grey[800]!;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left side: Amount and Request Details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Amount
              Text(
                request['amount'] ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 6),
              // Requested Date
              Text(
                'Requested: ${request['date'] ?? ''}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 4),
              // Estimated Completion Date
              Text(
                'Est. completion: ${request['completionDate'] ?? ''}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
          
          // Right side: Status Chip
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: statusBgColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: statusFgColor,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey[200]!, width: 1),
      ),
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header Row (Payout Requests Title & New Request Button)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Payout Requests', 
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black87,
                  )
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text('New Request'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue[700],
                    textStyle: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 12),
            
            // List of Payout Requests
            ...requests.map((request) => _buildRequestCard(request)).toList(),
          ],
        ),
      ),
    );
  }
}
