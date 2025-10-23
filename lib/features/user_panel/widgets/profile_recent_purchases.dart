import 'package:flutter/material.dart';

class ProfileRecentPurchases extends StatelessWidget {
  final purchases = const [
    {'title': 'Premium Subscription', 'order': '#12345', 'date': 'Oct 15, 2024', 'amount': '\$29.99', 'status': 'Completed', 'icon': Icons.shopping_bag_outlined},
    {'title': 'Digital Course Bundle', 'order': '#12344', 'date': 'Oct 10, 2024', 'amount': '\$149.99', 'status': 'Completed', 'icon': Icons.shopping_cart_outlined},
    // Adding a third example purchase for a fuller list view
    {'title': 'Ebook: Flutter Mastery', 'order': '#12343', 'date': 'Sep 29, 2024', 'amount': '\$19.99', 'status': 'Completed', 'icon': Icons.book_outlined},
  ];

  // Utility method to build each transaction row
  Widget _buildPurchaseItem(Map<String, dynamic> purchase) {
    // Determine status color for the chip
    Color statusBgColor = Colors.green[50]!;
    Color statusFgColor = Colors.green[800]!;
    
    // Icon and background container for the item type
    Widget iconContainer = Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        purchase['icon'] as IconData?,
        color: Colors.grey[700],
        size: 24,
      ),
    );

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              iconContainer,
              const SizedBox(width: 16),
              
              // Title and Subtitle (Order ID + Date)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      purchase['title'] as String,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${purchase['order']} • ${purchase['date']}',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              
              // Amount and Status Chip (Right-aligned)
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    purchase['amount'] as String,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: statusBgColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      purchase['status'] as String,
                      style: TextStyle(
                        color: statusFgColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Divider to separate list items, matching the subtle look in the image
        Divider(color: Colors.grey[200], height: 1),
      ],
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
            // Header Row (Recent Purchases Title & View All Button)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recent Purchases', 
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black87,
                  )
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('View All'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue[700],
                    textStyle: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 12),
            
            // List of Purchase Items
            ...purchases.map((purchase) => _buildPurchaseItem(purchase)).toList(),
            
            // Removing the extra divider often placed after the last item in a list
          ],
        ),
      ),
    );
  }
}
