import 'package:flutter/material.dart';

// Assuming this file exists from your previous requests
import 'package:tree_marketplace_app/core/constants/app_colors.dart';

// You might want to define a Tree model if you haven't already
class Tree {
  final String id;
  final String name;
  final String description;
  final String grade; // e.g., "Premium Grade", "Standard Grade"
  final double price;
  final bool available; // For "12 available" at the top

  Tree({
    required this.id,
    required this.name,
    required this.description,
    required this.grade,
    required this.price,
    this.available = true,
  });
}

class SellTreesScreen extends StatefulWidget {
  const SellTreesScreen({super.key});

  @override
  State<SellTreesScreen> createState() => _SellTreesScreenState();
}

class _SellTreesScreenState extends State<SellTreesScreen> {
  // Dummy data for eligible trees
  final List<Tree> eligibleTrees = [
    Tree(
      id: '001',
      name: 'Red Oak',
      description: '15 years • 28 ft • Healthy/Market rate',
      grade: 'Premium Grade',
      price: 320.00,
    ),
    Tree(
      id: '002',
      name: 'Pine Cedar',
      description: '12 years • 22 ft • Healthy/Market rate',
      grade: 'Standard Grade',
      price: 185.00,
    ),
    Tree(
      id: '003',
      name: 'Maple Sugar',
      description: '18 years • 32 ft • Excellent',
      grade: 'Premium Plan',
      price: 425.00,
    ),
    Tree(
      id: '004',
      name: 'White Oak',
      description: '20 years • 35 ft • Excellent',
      grade: 'Premium Grade',
      price: 485.00,
    ),
  ];

  // Keep track of selected trees for sale
  final Set<String> _selectedTreeIds = {};

  void _toggleTreeSelection(String treeId) {
    setState(() {
      if (_selectedTreeIds.contains(treeId)) {
        _selectedTreeIds.remove(treeId);
      } else {
        _selectedTreeIds.add(treeId);
      }
    });
  }

  double get _totalSelectedValue {
    return _selectedTreeIds.fold(0.0, (sum, id) {
      final tree = eligibleTrees.firstWhere((t) => t.id == id);
      return sum + tree.price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _buildAppBar(context),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 140), // Increased space for bottom bar
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTotalTreeValue(),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: _buildPriceCalculator(),

                ),

                const SizedBox(height: 24),
                 _buildDivider(),
                 const SizedBox(height: 24),
                _buildEligibleTrees(),
              ],
            ),
          ),
          _buildBottomBar(), // Positioned at the bottom
        ],
      ),
    );
  }

  // --- 1. App Bar ---
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0, // No shadow
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColors.textTitle),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: const Text(
        'Sell Trees',
        style: TextStyle(
            color: AppColors.textTitle,
            fontWeight: FontWeight.bold,
            fontSize: 18),
      ),
      centerTitle: true,
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: Icon(Icons.more_vert, color: AppColors.textTitle),
        ),
      ],
    );
  }

  // --- 2. Total Tree Value Section ---
  Widget _buildTotalTreeValue() {
    return Container(
      color: AppColors.primaryGreen, // Dark green background
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
      child: Column(
        children: [
          const Text(
            'Total Tree Value',
            style: TextStyle(
                color: AppColors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          const Text(
            '\$2,847.50',
            style: TextStyle(
                color: AppColors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            'Based on current market rates.',
            style: TextStyle(
                color: AppColors.white.withOpacity(0.8), fontSize: 12),
          ),
        ],
      ),
    );
  }

  // --- 3. Price Calculator Section ---
  // --- 3. Price Calculator Section ---
Widget _buildPriceCalculator() {
  return Container(
    padding: const EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      // Changed the background color to light gray
      color: AppColors.lightGrey,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: AppColors.shadowColor.withOpacity(0.1),
          blurRadius: 10,
          offset: const Offset(0, 5),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Price Calculator',
          style: TextStyle(
              color: AppColors.textTitle,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildCalculatorRow('Tree Type', 'Oak', showDropdown: true),
        _buildDivider(),
        _buildCalculatorRow('Age (years)', '15'),
        _buildDivider(),
        _buildCalculatorRow('Height (ft)', '25'),
        _buildDivider(),
        _buildCalculatorRow('Estimated Price', '\$285', isPrice: true),
      ],
    ),
  );
}

  Widget _buildCalculatorRow(String label, String value,
    {bool showDropdown = false, bool isPrice = false}) {
  return Padding(
    // Increased vertical padding for better spacing
    padding: const EdgeInsets.symmetric(vertical: 12.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            // Matched style from the image
            color: AppColors.textBody,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Row(
          children: [
            Text(
              value,
              style: TextStyle(
                color: isPrice ? AppColors.primaryGreen : AppColors.textTitle,
                // Price text is larger and bolder
                fontSize: isPrice ? 22 : 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (showDropdown)
              const Padding(
                padding: EdgeInsets.only(left: 4.0),
                child: Icon(Icons.keyboard_arrow_down, color: AppColors.textTitle),
              ),
          ],
        ),
      ],
    ),
  );
}

  Widget _buildDivider() {
    return const Divider(
      color: AppColors.borderColor,
      height: 1,
      thickness: 1,
      indent: 0,
      endIndent: 0,
    );
  }

  // --- 4. Eligible Trees Section ---
  Widget _buildEligibleTrees() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Eligible Trees',
                style: TextStyle(
                    color: AppColors.textTitle,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '${eligibleTrees.length} available',
                style: const TextStyle(
                    color: AppColors.textBody,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // List of eligible trees
          ...eligibleTrees.map((tree) => Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: _buildTreeItem(tree),
              )),
        ],
      ),
    );
  }

 // ------------ Eligible Tree Item (Updated) ------------
Widget _buildTreeItem(Tree tree) {
  bool isSelected = _selectedTreeIds.contains(tree.id);
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: AppColors.borderColor,
        width: 1.5,
      ),
      boxShadow: [
        BoxShadow(
          color: AppColors.shadowColor.withOpacity(0.08),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      children: [
        // --- Top Section: Icon, Details, and Price ---
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon Container
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: AppColors.lightGreenBackground,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.park,
                  color: AppColors.primaryGreenDark, size: 40),
            ),
            const SizedBox(width: 12),

            // Details Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${tree.name} #${tree.id}',
                    style: const TextStyle(
                        color: AppColors.textTitle,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    tree.description,
                    style: const TextStyle(color: AppColors.textBody, fontSize: 13),
                  ),
                  const SizedBox(height: 8),
                  // Grade Chip
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: _getGradeColor(tree.grade).withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      tree.grade,
                      style: TextStyle(
                          color: _getGradeColor(tree.grade),
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),

            // Price Column
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$${tree.price.toInt()}', // Displaying as integer like in the image
                  style: const TextStyle(
                      color: AppColors.primaryGreen,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                const SizedBox(height: 2),
                const Text(
                  'Market rate',
                  style: TextStyle(color: AppColors.textBody, fontSize: 11),
                ),
              ],
            ),
          ],
        ),
        const Divider(height: 24),

        // --- Bottom Section: Checkbox and Details Link ---
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Using GestureDetector to make the whole area tappable
            GestureDetector(
              onTap: () => _toggleTreeSelection(tree.id),
              // Use a transparent color to make the gesture detector hit area larger
              behavior: HitTestBehavior.translucent,
              child: Row(
                children: [
                  Checkbox(
                    value: isSelected,
                    onChanged: (bool? newValue) {
                      _toggleTreeSelection(tree.id);
                    },
                    activeColor: AppColors.primaryGreen,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    side: const BorderSide(
                        color: AppColors.borderColor, width: 2),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'Select for sale',
                    style: TextStyle(
                        color: AppColors.textBody,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const Text(
              'View Details',
              style: TextStyle(
                  color: AppColors.primaryGreenDark,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    ),
  );
}

  // Helper to determine color based on grade
  Color _getGradeColor(String grade) {
    switch (grade) {
      case 'Premium Grade':
        return AppColors.darkOrange; // Using darkOrange for Premium
      case 'Premium Plan': // Assuming Premium Plan is also a good grade
        return AppColors.darkOrange;
      case 'Standard Grade':
        return AppColors.blue; // Using blue for Standard
      default:
        return AppColors.textBody;
    }
  }

  // --- 5. Bottom Bar (Corrected) ---
  Widget _buildBottomBar() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.fromLTRB(16, 12, 16, MediaQuery.of(context).padding.bottom + 8),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor.withOpacity(0.15),
              blurRadius: 10,
              offset: const Offset(0, -5), // Shadow upwards
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Selected (${_selectedTreeIds.length} tree${_selectedTreeIds.length == 1 ? '' : 's'})',
                  style: const TextStyle(
                      color: AppColors.textTitle,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  '\$${_totalSelectedValue.toStringAsFixed(2)}',
                  style: const TextStyle(
                      color: AppColors.textTitle,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: _selectedTreeIds.isEmpty
                  ? null
                  : () {
                      // Handle submit request
                      print('Submit Sell Request for trees: $_selectedTreeIds');
                    },
              icon: const Icon(Icons.send, size: 20),
              label: const Text(
                'Submit Sell Request',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryGreen,
                foregroundColor: AppColors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Processing fee: 3.5% • Estimated payout: 3-5 days',
              style: TextStyle(color: AppColors.textBody.withOpacity(0.7), fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}