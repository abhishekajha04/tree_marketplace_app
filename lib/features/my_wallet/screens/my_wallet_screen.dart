import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../features/my_wallet/widgets/balance_card.dart';
import '../../../features/my_wallet/widgets/transaction_tile.dart';
import '../../../features/my_wallet/widgets/wallet_stat_card.dart';

class MyWalletScreen extends StatelessWidget {
  static const routeName = '/my-wallet';

  const MyWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(icon: Icon(Icons.arrow_back), onPressed: null),
        title: const Text('My Wallet'),
        actions: [IconButton(icon: const Icon(Icons.more_vert), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BalanceCard(),
              const SizedBox(height: 24.0),
              Row(
                children: [
                  const WalletStatCard(
                    icon: Icons.arrow_upward,
                    title: 'Total Earnings',
                    amount: '\$8,420.30',
                    tagText: '+12%',
                    tagColor: AppColors.lightGreenBackground, 
                    tagTextColor: AppColors.completedGreen, 
                  ),
                  const SizedBox(width: 16),
                  const WalletStatCard(
                    icon: Icons.arrow_downward,
                    title: 'Total Payouts',
                    amount: '\$4,572.80',
                    tagText: '5 this month',
                    tagColor: AppColors.lightBlueBackground, 
                    tagTextColor: AppColors.blue, 
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recent Transactions',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textTitle,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'View All',
                      style: TextStyle(color: AppColors.primaryGreen),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              const TransactionTile(
                icon: Icons.add,
                iconBgColor: AppColors.lightGreenBackground,
                iconColor: AppColors.completedGreen,
                title: 'Payment Received',
                subtitle: 'From Client ABC Corp',
                amount: '850.00',
                date: '2 hours ago',
                type: TransactionType.credit,
              ),
              const Divider(height: 1, color: AppColors.borderColor),
              const TransactionTile(
                icon: Icons.account_balance,
                iconBgColor: AppColors.lightBlueBackground,
                iconColor: AppColors.blue,
                title: 'Bank Withdrawal',
                subtitle: 'To Chase Bank ****1234',
                amount: '500.00',
                date: 'Yesterday',
                type: TransactionType.debit,
              ),
              const Divider(height: 1, color: AppColors.borderColor),
              const TransactionTile(
                icon: Icons.add,
                iconBgColor: AppColors.lightGreenBackground,
                iconColor: AppColors.completedGreen,
                title: 'Project Payment',
                subtitle: 'Website Design Project',
                amount: '1,200.00',
                date: '2 days ago',
                type: TransactionType.credit,
              ),
              const Divider(height: 1, color: AppColors.borderColor),
              const TransactionTile(
                icon: Icons.receipt_long,
                iconBgColor: AppColors.lightRedBackground, 
                iconColor: AppColors.errorText,           
                title: 'Service Fee',
                subtitle: 'Platform commission',
                amount: '42.50',
                date: '3 days ago',
                type: TransactionType.debit,
              ),
              const Divider(height: 1, color: AppColors.borderColor),
              const TransactionTile(
                icon: Icons.add,
                iconBgColor: AppColors.lightGreenBackground,
                iconColor: AppColors.completedGreen,
                title: 'Bonus Payment',
                subtitle: 'Performance bonus',
                amount: '300.00',
                date: '1 week ago',
                type: TransactionType.credit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}