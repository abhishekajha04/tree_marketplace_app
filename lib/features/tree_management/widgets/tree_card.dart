import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_button.dart';

class TreeCard extends StatelessWidget {
  final Map<String, dynamic> tree;
  const TreeCard({required this.tree});

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    if (tree['status'] == 'Active') {
      statusColor = AppColors.primaryGreen;
    } else if (tree['status'] == 'Low Stock') {
      statusColor = AppColors.orange;
    } else {
      statusColor = AppColors.red;
    }

    return AspectRatio(
      aspectRatio: 0.75,
      child: Card(
        elevation: 3,
         color: AppColors.white,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.asset(
                      tree['image'],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(
                      color: statusColor,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Text(
                      tree['status'],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Info block
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tree['title'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: AppColors.textTitle,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      tree['description'],
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textBody,
                        height: 1.4,
                      ),
                    ),
                    SizedBox(height: 14),
                    _DataRow(label: "Growth Time:", value: tree['growth'], valueBold: true),
                    SizedBox(height: 4),
                    _DataRow(label: "Current Price:", value: "\$${tree['price']}", valueColor: AppColors.primaryGreen),
                    SizedBox(height: 4),
                    _DataRow(label: "Resale Value:", value: "\$${tree['resale']}", valueColor: AppColors.accent),
                    Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            text: 'Edit',
                            onPressed: () {},
                            height: 40,
                            borderRadius: 8,
                            backgroundColor: AppColors.primaryGreen,
                          ),
                        ),
                        SizedBox(width: 12),
                        Container(
                          height: 40, width: 48,
                          decoration: BoxDecoration(
                            color: AppColors.lightGrey,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.delete_outline, color: AppColors.textBody),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class _DataRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;
  final bool valueBold;

  const _DataRow({required this.label, required this.value, this.valueColor, this.valueBold = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label,
            style: TextStyle(fontSize: 13, color: AppColors.textBody)),
        SizedBox(width: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 13,
            color: valueColor ?? AppColors.textTitle,
            fontWeight: valueBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
