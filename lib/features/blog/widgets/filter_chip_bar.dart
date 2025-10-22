import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class FilterChipBar extends StatefulWidget {
  const FilterChipBar({Key? key}) : super(key: key);

  @override
  _FilterChipBarState createState() => _FilterChipBarState();
}

class _FilterChipBarState extends State<FilterChipBar> {
  int _selectedIndex = 0;
  final List<String> _filters = ['All', 'Investment', 'Policies', 'Environment'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
      child: Row(
        children: List.generate(_filters.length, (index) {
          final bool isSelected = _selectedIndex == index;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: ChoiceChip(
              label: Text(_filters[index]),
              selected: isSelected,
              onSelected: (bool selected) {
                setState(() {
                  _selectedIndex = selected ? index : _selectedIndex;
                });
              },
              backgroundColor: AppColors.inactiveChip,
              selectedColor: AppColors.primaryGreen,
              labelStyle: TextStyle(
                color: isSelected ? AppColors.white : AppColors.textBody,
                fontWeight: FontWeight.bold,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              side: BorderSide.none,
            ),
          );
        }),
      ),
    );
  }
}

