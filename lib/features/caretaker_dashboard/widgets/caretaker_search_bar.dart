import 'package:flutter/material.dart';

class CaretakerSearchBar extends StatefulWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onSearchChanged;
  final ValueChanged<String>? onPerformanceFilterChanged;
  final String initialPerformanceFilter;

  const CaretakerSearchBar({
    super.key,
    this.controller,
    this.onSearchChanged,
    this.onPerformanceFilterChanged,
    this.initialPerformanceFilter = 'All Performance',
  });

  @override
  State<CaretakerSearchBar> createState() => _CaretakerSearchBarState();
}

class _CaretakerSearchBarState extends State<CaretakerSearchBar> {
  late TextEditingController _searchController;
  String _selectedPerformanceFilter = 'All Performance';

  static const List<String> _performanceFilters = [
    'All Performance',
    'High (90% +)',
    'Medium (70-89%)',
    'Low (Below 70%)',
  ];

  @override
  void initState() {
    super.initState();
    _searchController = widget.controller ?? TextEditingController();
    _selectedPerformanceFilter = widget.initialPerformanceFilter;
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
   
    if (widget.controller == null) {
      _searchController.dispose();
    }
    super.dispose();
  }

  void _onSearchChanged() {
    widget.onSearchChanged?.call(_searchController.text);
  }

  void _onPerformanceFilterChanged(String? newValue) {
    if (newValue == null) return;
    
    setState(() {
      _selectedPerformanceFilter = newValue;
    });
    
    widget.onPerformanceFilterChanged?.call(newValue);
  }

  void _clearSearch() {
    _searchController.clear();
    widget.onSearchChanged?.call('');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Search Bar
        Expanded(
          child: _buildSearchField(),
        ),
        const SizedBox(width: 16),
       
        _buildPerformanceFilter(),
      ],
    );
  }

  Widget _buildSearchField() {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search caretakers...',
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear, color: Colors.grey, size: 20),
                  onPressed: _clearSearch,
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        ),
        onChanged: (value) {
         
          widget.onSearchChanged?.call(value);
        },
      ),
    );
  }

  Widget _buildPerformanceFilter() {
    return SizedBox(
      width: 200,
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: _selectedPerformanceFilter,
            icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
            isExpanded: true,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            dropdownColor: Colors.white,
            borderRadius: BorderRadius.circular(8),
            onChanged: _onPerformanceFilterChanged,
            items: _performanceFilters.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
