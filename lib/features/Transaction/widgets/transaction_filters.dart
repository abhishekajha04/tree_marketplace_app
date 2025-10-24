import 'package:flutter/material.dart';
import 'filter_dropdown.dart';

class TransactionFilters extends StatefulWidget {
  const TransactionFilters({super.key});

  @override
  State<TransactionFilters> createState() => _TransactionFiltersState();
}

class _TransactionFiltersState extends State<TransactionFilters> {
  String selectedType = 'All Types';
  String selectedStatus = 'All Status';
  String selectedDateRange = 'Last 30 days';
  String selectedAmountRange = 'Any Amount';
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with Title and Reset Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Transaction Filters',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      selectedType = 'All Types';
                      selectedStatus = 'All Status';
                      selectedDateRange = 'Last 30 days';
                      selectedAmountRange = 'Any Amount';
                      _searchController.clear();
                    });
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  child: const Text(
                    'Reset Filters',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          
          // Filter Grid with Labels
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 5,
            crossAxisSpacing: 16,
            mainAxisSpacing: 8,
            childAspectRatio: 3.5,
            children: [
              // Transaction Type Column
              _buildFilterColumn(
                label: 'Transaction Type',
                child: FilterDropdown(
                  value: selectedType,
                  items: const ['All Types', 'Purchase', 'Sale', 'Payment', 'Refund'],
                  onChanged: (value) {
                    setState(() {
                      selectedType = value!;
                    });
                  },
                ),
              ),
              
              // Status Column
              _buildFilterColumn(
                label: 'Status',
                child: FilterDropdown(
                  value: selectedStatus,
                  items: const ['All Status', 'Pending Approval', 'Approved', 'Rejected', 'Completed'],
                  onChanged: (value) {
                    setState(() {
                      selectedStatus = value!;
                    });
                  },
                ),
              ),
              
              // Date Range Column
              _buildFilterColumn(
                label: 'Date Range',
                child: FilterDropdown(
                  value: selectedDateRange,
                  items: const ['Last 30 days', 'Last 7 days', 'Last 90 days', 'Custom Range'],
                  onChanged: (value) {
                    setState(() {
                      selectedDateRange = value!;
                    });
                  },
                ),
              ),
              
              // Amount Range Column
              _buildFilterColumn(
                label: 'Amount Range',
                child: FilterDropdown(
                  value: selectedAmountRange,
                  items: const ['Any Amount', '\$0 - \$100', '\$100 - \$500', '\$500 - \$1000', '\$1000+'],
                  onChanged: (value) {
                    setState(() {
                      selectedAmountRange = value!;
                    });
                  },
                ),
              ),
              
              // Search Column
              _buildFilterColumn(
                label: 'Search',
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 12, right: 8),
                        child: Icon(Icons.search, size: 18, color: Colors.grey),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          decoration: const InputDecoration(
                            hintText: 'Search transactions...',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 12),
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterColumn({required String label, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Expanded(child: child),
      ],
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}