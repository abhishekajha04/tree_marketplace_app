import 'package:flutter/material.dart';

class ProfileKycDocuments extends StatelessWidget {
  final List<Map<String, String>> kycDocs = const [
    {'type': 'ID Card', 'status': 'Verified', 'date': 'Jan 15, 2023', 'iconCode': '0xe31f'}, // Icons.badge
    {'type': 'Proof of Address', 'status': 'Verified', 'date': 'Jan 16, 2023', 'iconCode': '0xe87a'}, // Icons.description
    {'type': 'Selfie Verification', 'status': 'Pending', 'date': 'Jan 20, 2023', 'iconCode': '0xe3a8'}, // Icons.camera_alt
  ];

  // Utility method to build each document card
  Widget _buildDocumentCard(Map<String, String> doc) {
    final bool isVerified = doc['status'] == 'Verified';
    final Color statusColor = isVerified ? Colors.green[700]! : Colors.orange[700]!;
    final Color backgroundColor = isVerified ? Colors.green[50]! : Colors.orange[50]!;
    
    // Get the appropriate icon based on the document type
    IconData iconData = IconData(int.parse(doc['iconCode']!), fontFamily: 'MaterialIcons');

    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8), // Spacing between cards
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Document Icon and Title Row
            Row(
              children: [
                Icon(iconData, color: Colors.blue[600], size: 22),
                const SizedBox(width: 8),
                Expanded( // Ensures the text takes the space it needs
                  child: Text(
                    doc['type'] ?? '',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Colors.blue[600],
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 12),
            
            // Status Chip and Date (aligned right and left)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Displaying the status chip with checkmark/pending icon
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isVerified ? Icons.check : Icons.hourglass_empty, 
                        color: statusColor, 
                        size: 14
                      ),
                      const SizedBox(width: 4),
                      Text(
                        doc['status'] ?? '',
                        style: TextStyle(
                          color: statusColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),
            
            // Upload Date
            Text(
              'Uploaded: ${doc['date'] ?? ""}',
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[600],
              ),
            ),

            const SizedBox(height: 16),
            
            // View Document Link
            GestureDetector(
              onTap: () {},
              child: Text(
                'View Document',
                style: TextStyle(
                  color: Colors.blue[700],
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  // Adding underline to match the link style in the image
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
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
            // Header Row (KYC Documents Title & Upload Document Button)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'KYC Documents',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.cloud_upload, size: 18),
                  label: const Text('Upload Document'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue[700],
                    textStyle: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 20),
            
            // Row containing all three document cards
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: kycDocs.map((doc) => _buildDocumentCard(doc)).toList(),
            ),
            
            // Note: Removed the extra "Upload Document" button that was aligned left
            // as the design in the image only shows the button in the header.
          ],
        ),
      ),
    );
  }
}
