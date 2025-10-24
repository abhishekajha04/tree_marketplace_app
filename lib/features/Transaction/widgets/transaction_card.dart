import 'package:flutter/material.dart';
import 'transaction_model.dart';


Widget typeBadge(String type) {
  Color bg;
  Color fg;
  IconData icon;
  switch (type) {
    case 'Purchase':
      bg = Colors.blue.shade50;
      fg = Colors.blue;
      icon = Icons.shopping_cart;
      break;
    case 'Sale Request':
      bg = Colors.green.shade50;
      fg = Colors.green;
      icon = Icons.request_page;
      break;
    case 'Payment':
      bg = Colors.purple.shade50;
      fg = Colors.purple;
      icon = Icons.credit_card;
      break;
    case 'Refund':
      bg = Colors.red.shade50;
      fg = Colors.red;
      icon = Icons.undo;
      break;
    default:
      bg = Colors.grey.shade100;
      fg = Colors.grey;
      icon = Icons.info_outline;
  }
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
      color: bg,
      borderRadius: BorderRadius.circular(14),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: fg, size: 17),
        const SizedBox(width: 4),
        Text(type, style: TextStyle(color: fg, fontWeight: FontWeight.w600, fontSize: 13)),
      ],
    ),
  );
}


Widget statusBadge(String status) {
  Color bg;
  Color fg;
  switch (status) {
    case 'Pending Approval':
      bg = Colors.yellow.shade100;
      fg = Colors.orange.shade700;
      break;
    case 'Approved':
      bg = Colors.green.shade100;
      fg = Colors.green.shade700;
      break;
    case 'Rejected':
      bg = Colors.red.shade100;
      fg = Colors.red.shade700;
      break;
    case 'Completed':
      bg = Colors.blue.shade100;
      fg = Colors.blue.shade700;
      break;
    default:
      bg = Colors.grey.shade100;
      fg = Colors.grey;
  }
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
    decoration: BoxDecoration(
      color: bg,
      borderRadius: BorderRadius.circular(14),
    ),
    child: Text(status, style: TextStyle(color: fg, fontWeight: FontWeight.w600, fontSize: 13)),
  );
}

class TransactionCard extends StatelessWidget {
  final Transaction transaction;
  const TransactionCard({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(transaction.id, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                SizedBox(height: 2),
                Text(transaction.paymentMethod, style: TextStyle(fontSize: 10, color: Colors.grey[500])),
              ],
            ),
          ),
        
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: typeBadge(transaction.type),
            ),
          ),
       
          Expanded(
            flex: 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  backgroundImage: NetworkImage(transaction.userAvatar),
                  radius: 13,
                ),
                const SizedBox(width: 6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(transaction.userName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    Text(transaction.userEmail, style: TextStyle(fontSize: 10, color: Colors.grey[500])),
                  ],
                ),
              ],
            ),
          ),
        
          Expanded(
            flex: 2,
            child: Text(transaction.amount, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          ),
         
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.date.split(' ')[0] + " " + transaction.date.split(' ')[1].replaceAll(',', ''),
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(
                  transaction.date.split(' ').sublist(2).join(' '),
                  style: TextStyle(fontSize: 10, color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          // Status badge
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: statusBadge(transaction.status),
            ),
          ),
          // Action buttons
          Expanded(
            flex: 3,
            child: _actionButtons(transaction.status),
          ),
        ],
      ),
    );
  }

  Widget _actionButtons(String status) {
    if (status == "Pending Approval") {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _actionBtn("Approve", Colors.green, Icons.check, true),
          SizedBox(width: 5),
          _actionBtn("Reject", Colors.red, Icons.close, true),
          SizedBox(width: 5),
          Icon(Icons.remove_red_eye_outlined, color: Colors.grey[600], size: 18),
        ],
      );
    } else if (status == "Approved") {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _actionBtn("Approved", Colors.green.shade100, Icons.check_circle, false, txtColor: Colors.green),
          SizedBox(width: 5),
          Icon(Icons.remove_red_eye_outlined, color: Colors.grey[600], size: 18),
        ],
      );
    } else if (status == "Rejected") {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _actionBtn("Rejected", Colors.red.shade100, Icons.cancel, false, txtColor: Colors.red),
          SizedBox(width: 5),
          Icon(Icons.remove_red_eye_outlined, color: Colors.grey[600], size: 18),
        ],
      );
    } else if (status == "Completed") {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _actionBtn("Completed", Colors.blue.shade100, Icons.done_all, false, txtColor: Colors.blue),
          SizedBox(width: 5),
          Icon(Icons.remove_red_eye_outlined, color: Colors.grey[600], size: 18),
        ],
      );
    }
    return Icon(Icons.remove_red_eye_outlined, color: Colors.grey[600], size: 18);
  }

  Widget _actionBtn(String text, Color color, IconData icon, bool active, {Color? txtColor}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: (active ? color : Colors.transparent)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: txtColor ?? Colors.white, size: 15),
          const SizedBox(width: 3),
          Text(
            text,
            style: TextStyle(
              color: txtColor ?? Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
