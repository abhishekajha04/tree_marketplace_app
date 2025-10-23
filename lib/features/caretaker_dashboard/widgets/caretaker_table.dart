import 'package:flutter/material.dart';
import '../screens/caretaker_dashboard_screen.dart';
import 'caretaker_row_item.dart';

class CaretakerTable extends StatelessWidget {
  final List<Caretaker> caretakers;

  const CaretakerTable({super.key, required this.caretakers});

  @override
  Widget build(BuildContext context) {
   
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade300, width: 1),
              ),
            ),
            child: Row(
              children: [
                // Caretaker Column
                Expanded(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Caretaker',
                      style: _headerTextStyle(),
                    ),
                  ),
                ),
                
                
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Assigned Trees',
                      style: _headerTextStyle(),
                    ),
                  ),
                ),
                
                
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Performance',
                      style: _headerTextStyle(),
                    ),
                  ),
                ),
                
               
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Last Activity',
                      style: _headerTextStyle(),
                    ),
                  ),
                ),
                
               
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Status',
                      style: _headerTextStyle(),
                    ),
                  ),
                ),
                
                // Actions Column
                Expanded(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Actions',
                      style: _headerTextStyle(),
                    ),
                  ),
                ),
              ],
            ),
          ),

         
          _buildTableBody(),
        ],
      ),
    );
  }

  TextStyle _headerTextStyle() {
    return const TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 14,
      color: Color(0xFF555555),
      letterSpacing: 0.2,
    );
  }

  Widget _buildTableBody() {
    if (caretakers.isEmpty) {
      return _buildEmptyState();
    }
    
    return Scrollbar(
      thumbVisibility: true,
      radius: const Radius.circular(6),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: caretakers.length,
        separatorBuilder: (context, index) => const Divider(
          height: 1,
          color: Color(0xFFEEEEEE),
        ),
        itemBuilder: (context, index) => CaretakerRowItem(
          caretaker: caretakers[index],
        ),
      ),
    );
  }


  Widget _buildEmptyState() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.people_outline,
              size: 48,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 12),
            Text(
              'No caretakers found',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Add caretakers to get started',
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}