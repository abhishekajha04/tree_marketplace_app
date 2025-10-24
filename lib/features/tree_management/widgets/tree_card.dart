import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_button.dart';

class TreeCard extends StatelessWidget {
  final Map<String, dynamic> tree;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onTap;
  final bool isSelected;

  const TreeCard({
    required this.tree,
    this.onEdit,
    this.onDelete,
    this.onTap,
    this.isSelected = false,
    Key? key,
  }) : super(key: key);

  Color get statusColor {
    switch (tree['status']) {
      case 'Active':
        return AppColors.primaryGreen;
      case 'Low Stock':
        return AppColors.orange;
      case 'Out of Stock':
        return AppColors.red;
      case 'Draft':
        return AppColors.textBody;
      default:
        return AppColors.lightGrey;
    }
  }

  Color get statusBgColor {
    switch (tree['status']) {
      case 'Active':
        return AppColors.primaryGreen.withOpacity(0.15);
      case 'Low Stock':
        return AppColors.orange.withOpacity(0.15);
      case 'Out of Stock':
        return AppColors.red.withOpacity(0.15);
      case 'Draft':
        return AppColors.lightGrey;
      default:
        return AppColors.lightGrey;
    }
  }

  IconData get statusIcon {
    switch (tree['status']) {
      case 'Active':
        return Icons.check_circle;
      case 'Low Stock':
        return Icons.warning;
      case 'Out of Stock':
        return Icons.error;
      case 'Draft':
        return Icons.drafts;
      default:
        return Icons.help;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.75,
      child: Card(
        elevation: isSelected ? 6 : 3,
        color: isSelected
            ? AppColors.primaryGreen.withOpacity(0.05)
            : AppColors.white,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: isSelected
              ? BorderSide(color: AppColors.primaryGreen, width: 2)
              : BorderSide(
                  color: AppColors.borderColor.withOpacity(0.3),
                  width: 1,
                ),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
             
              Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 2,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      child: Image.asset(
                        tree['image'],
                        fit: BoxFit.cover,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: AppColors.lightGrey,
                            child: const Icon(
                              Icons.park,
                              size: 60,
                              color: AppColors.textBody,
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                 
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: statusBgColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: statusColor.withOpacity(0.3)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(statusIcon, size: 12, color: statusColor),
                          const SizedBox(width: 4),
                          Text(
                            tree['status'],
                            style: TextStyle(
                              color: statusColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                
                  if (tree['status'] == 'Low Stock')
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 4,
                        color: AppColors.orange.withOpacity(0.3),
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: tree['stockLevel'] ?? 0.3,
                          child: Container(color: AppColors.orange),
                        ),
                      ),
                    ),

                
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          tree['isFavorite'] == true
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 16,
                          color: tree['isFavorite'] == true
                              ? AppColors.red
                              : AppColors.textBody,
                        ),
                        onPressed: () {
                       
                        },
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ],
              ),

            
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                   
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              tree['title'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: AppColors.textTitle,
                                height: 1.2,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (tree['category'] != null)
                            Container(
                              margin: const EdgeInsets.only(left: 8),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.lightGrey,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                tree['category'],
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: AppColors.textBody,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                        ],
                      ),

                      const SizedBox(height: 6),

                   
                      Expanded(
                        child: Text(
                          tree['description'],
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.textBody,
                            height: 1.4,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      const SizedBox(height: 12),

                   
                      _DataRow(
                        label: "Growth Time:",
                        value: tree['growth'],
                        valueBold: true,
                        icon: Icons.schedule,
                      ),
                      const SizedBox(height: 6),
                      _DataRow(
                        label: "Current Price:",
                        value: "\$${tree['price']}",
                        valueColor: AppColors.primaryGreen,
                        icon: Icons.attach_money,
                      ),
                      const SizedBox(height: 6),
                      _DataRow(
                        label: "Resale Value:",
                        value: "\$${tree['resale']}",
                        valueColor: AppColors.accent,
                        icon: Icons.trending_up,
                      ),

                    
                      if (tree['plantedCount'] != null) ...[
                        const SizedBox(height: 6),
                        _DataRow(
                          label: "Planted:",
                          value: "${tree['plantedCount']} trees",
                          valueColor: AppColors.textBody,
                          icon: Icons.eco,
                        ),
                      ],

                      const Spacer(),

                    
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              text: 'Edit',
                              onPressed: tree['isLoading'] == true
                                  ? () {}
                                  : (onEdit ?? () {}),
                              height: 40,
                              borderRadius: 8,
                              backgroundColor: AppColors.primaryGreen,
                              textColor: Colors.white,
                              isLoading: tree['isLoading'] == true,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Container(
                            height: 40,
                            width: 48,
                            decoration: BoxDecoration(
                              color: AppColors.lightGrey,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColors.borderColor),
                            ),
                            child: IconButton(
                              onPressed: onDelete,
                              icon: Icon(
                                Icons.delete_outline,
                                color: onDelete == null
                                    ? AppColors.textBody.withOpacity(0.3)
                                    : AppColors.textBody,
                              ),
                              tooltip: 'Delete',
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
      ),
    );
  }
}

class _DataRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;
  final bool valueBold;
  final IconData? icon;

  const _DataRow({
    required this.label,
    required this.value,
    this.valueColor,
    this.valueBold = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (icon != null) ...[
          Icon(icon, size: 14, color: AppColors.textBody.withOpacity(0.7)),
          const SizedBox(width: 6),
        ],
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: AppColors.textBody,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            value,
            style: TextStyle(
              fontSize: 12,
              color: valueColor ?? AppColors.textTitle,
              fontWeight: valueBold ? FontWeight.bold : FontWeight.w600,
            ),
            textAlign: TextAlign.right,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
