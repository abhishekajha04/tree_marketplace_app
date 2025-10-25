import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class TreeFilterBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    const double fieldWidth = 260;
    const double fieldSpacing = 20;

    return Card(
      elevation: 0,
      color: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            Row(
              children: [
                Text(
                  "Filters",
                  style: TextStyle(
                    color: AppColors.textTitle,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text("Clear All", style: TextStyle(color: AppColors.textBody)),
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.textBody,
                    padding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ColumnField(
                  label: "Search",
                  width: fieldWidth,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: AppColors.textBody),
                      hintText: 'Search trees...',
                      hintStyle: TextStyle(color: AppColors.textBody),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: AppColors.borderColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: AppColors.borderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: AppColors.primaryGreen),
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 9, horizontal: 8),
                      fillColor: AppColors.lightGrey,
                      filled: true,
                    ),
                    style: TextStyle(color: AppColors.textBody),
                  ),
                ),
                SizedBox(width: fieldSpacing),
                _ColumnField(
                  label: 'Tree Type',
                  width: fieldWidth,
                  child: _DropdownField(
                    value: 'All Types',
                    items: ['All Types', 'Fruit', 'Evergreen', 'Flowering'],
                    onChanged: (val) {},
                  ),
                ),
                SizedBox(width: fieldSpacing),
                _ColumnField(
                  label: 'Status',
                  width: fieldWidth,
                  child: _DropdownField(
                    value: 'All Status',
                    items: ['All Status', 'Active', 'Low Stock', 'Out of Stock'],
                    onChanged: (val) {},
                  ),
                ),
                SizedBox(width: fieldSpacing),
                _ColumnField(
                  label: 'Price Range',
                  width: fieldWidth,
                  child: _DropdownField(
                    value: 'All Prices',
                    items: ['All Prices', 'Low', 'Medium', 'High'],
                    onChanged: (val) {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class _ColumnField extends StatelessWidget {
  final String label;
  final Widget child;
  final double width;

  const _ColumnField({required this.label, required this.child, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontSize: 13, color: AppColors.textBody, fontWeight: FontWeight.w500)),
          SizedBox(height: 6),
          child,
        ],
      ),
    );
  }
}


class _DropdownField extends StatelessWidget {
  final String value;
  final List<String> items;
  final ValueChanged<String?>? onChanged;

  const _DropdownField({required this.value, required this.items, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.textBody),
          style: TextStyle(color: AppColors.textTitle, fontSize: 14),
          items: items.map((e) =>
            DropdownMenuItem(value: e, child: Text(e))).toList(),
          onChanged: onChanged,
          dropdownColor: AppColors.white,
        ),
      ),
    );
  }
}
