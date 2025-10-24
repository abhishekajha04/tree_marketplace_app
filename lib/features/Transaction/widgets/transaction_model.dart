class Transaction {
  final String id;
  final String paymentMethod;
  final String type;
  final String userName;
  final String userEmail;
  final String userAvatar; 
  final String amount;
  final String date;
  final String status;

  const Transaction({
    required this.id,
    required this.paymentMethod,
    required this.type,
    required this.userName,
    required this.userEmail,
    required this.userAvatar,
    required this.amount,
    required this.date,
    required this.status,
  });
}

final List<Transaction> dummyTransactions = [
  const Transaction(
    id: '#TXN-001234',
    paymentMethod: 'Payment Gateway',
    type: 'Purchase',
    userName: 'Sarah Johnson',
    userEmail: 'sarah@example.com',
    userAvatar: 'https://randomuser.me/api/portraits/women/44.jpg',
    amount: '\$2,450.00',
    date: 'Oct 11, 2024 14:30',
    status: 'Pending Approval',
  ),
  const Transaction(
    id: '#TXN-001235',
    paymentMethod: 'Bank Transfer',
    type: 'Sale Request',
    userName: 'Michael Chen',
    userEmail: 'michael@example.com',
    userAvatar: 'https://randomuser.me/api/portraits/men/22.jpg',
    amount: '\$1,200.00',
    date: 'Oct 11, 2024 12:15',
    status: 'Approved',
  ),
  const Transaction(
    id: '#TXN-001236',
    paymentMethod: 'Credit Card',
    type: 'Payment',
    userName: 'Emma Davis',
    userEmail: 'emma@example.com',
    userAvatar: 'https://randomuser.me/api/portraits/women/85.jpg',
    amount: '\$875.50',
    date: 'Oct 11, 2024 10:45',
    status: 'Pending Approval',
  ),
  const Transaction(
    id: '#TXN-001237',
    paymentMethod: 'PayPal',
    type: 'Refund',
    userName: 'David Wilson',
    userEmail: 'david@example.com',
    userAvatar: 'https://randomuser.me/api/portraits/men/65.jpg',
    amount: '\$320.00',
    date: 'Oct 11, 2024 09:20',
    status: 'Rejected',
  ),
  const Transaction(
    id: '#TXN-001238',
    paymentMethod: 'Stripe',
    type: 'Purchase',
    userName: 'Lisa Anderson',
    userEmail: 'lisa@example.com',
    userAvatar: 'https://randomuser.me/api/portraits/women/65.jpg',
    amount: '\$1,850.00',
    date: 'Oct 10, 2024 16:30',
    status: 'Completed',
  ),
];
