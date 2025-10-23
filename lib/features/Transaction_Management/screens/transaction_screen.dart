import 'package:flutter/material.dart';
import '../widgets/transaction_filters.dart';
import '../widgets/transaction_list.dart';
import '../widgets/transaction_sidebar.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  int _selectedIndex = 1; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Row(
        children: [
          // Sidebar
          TransactionSidebar(
            selectedIndex: _selectedIndex,
            onItemSelected: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          
          // Main Content
          Expanded(
            child: _buildMainContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
   
    if (_selectedIndex != 1) {
      return _buildOtherScreen();
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section with Stats
            _buildHeaderWithStats(),
            const SizedBox(height: 24),
            
            // Task Description Section
            // _buildTaskDescription(),
            const SizedBox(height: 24),
            
            // Transaction Filters
            const TransactionFilters(),
            const SizedBox(height: 24),
            
            // Recent Transactions
            _buildRecentTransactionsHeader(),
            const SizedBox(height: 16),
            
            // Transaction List
            const TransactionList(),
            
            // Pagination
            // _buildPagination(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderWithStats() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Transaction Management',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Monitor and manage all financial transactions',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            
            // User Profile
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'John Smith',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Administrator',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 24),
        
        
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.2,
          children: [
            _buildStatCard(
              title: 'Total Transactions',
              value: '^^',
              subtitle: '+*% from last month',
              icon: Icons.account_balance_wallet,
              color: Colors.blue,
            ),
            _buildStatCard(
              title: 'Pending Approvals',
              value: '^^',
              subtitle: 'Requires attention',
              icon: Icons.pending_actions,
              color: Colors.orange,
            ),
            _buildStatCard(
              title: 'Total Volume',
              value: '\$^^',
              subtitle: '+8% increase',
              icon: Icons.trending_up,
              color: Colors.green,
            ),
            _buildStatCard(
              title: 'Failed Transactions',
              value: '^',
              subtitle: '-* from yesterday',
              icon: Icons.error_outline,
              color: Colors.red,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required String subtitle,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 12,
              color: _getSubtitleColor(subtitle),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Color _getSubtitleColor(String subtitle) {
    if (subtitle.contains('+')) return Colors.green;
    if (subtitle.contains('-')) return Colors.red;
    if (subtitle.contains('Requires')) return Colors.orange;
    return Colors.grey;
  }

  Widget _buildOtherScreen() {
    final screenTitles = [
      'Dashboard',
      'Transactions',
      'Users',
      'Reports',
      'Settings'
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          screenTitles[_selectedIndex],
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _getScreenIcon(),
              size: 64,
              color: Colors.blue,
            ),
            const SizedBox(height: 16),
            Text(
              '${screenTitles[_selectedIndex]} Screen',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'This page is under development',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getScreenIcon() {
    switch (_selectedIndex) {
      case 0:
        return Icons.dashboard;
      case 1:
        return Icons.account_balance_wallet;
      case 2:
        return Icons.people;
      case 3:
        return Icons.bar_chart;
      case 4:
        return Icons.settings;
      default:
        return Icons.account_balance_wallet;
    }
  }

  

  

  Widget _buildRecentTransactionsHeader() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        'Recent Transactions',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      Row(
        children: [
         
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(6),
            ),
            child: TextButton.icon(
              onPressed: () {
               
              },
              icon: const Icon(
                Icons.file_download_outlined,
                size: 16,
                color: Colors.grey,
              ),
              label: const Text(
                'Export',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
            ),
          ),
          const SizedBox(width: 12),
         
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(6),
            ),
            child: TextButton.icon(
              onPressed: () {
                
              },
              icon: const Icon(
                Icons.add,
                size: 16,
                color: Colors.white,
              ),
              label: const Text(
                'New Transaction',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
  
}