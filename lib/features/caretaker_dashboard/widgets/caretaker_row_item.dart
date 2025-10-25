import 'package:flutter/material.dart';
import '../screens/caretaker_dashboard_screen.dart';
import 'caretaker_tree_chip.dart';
import 'caretaker_status_chip.dart';
import 'caretaker_action_buttons.dart';

class CaretakerRowItem extends StatelessWidget {
  final Caretaker caretaker;

  const CaretakerRowItem({super.key, required this.caretaker});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Expanded(
            flex: 3,
            child: _buildCaretakerInfo(),
          ),

          
          Expanded(
            flex: 2,
            child: _buildAssignedTrees(),
          ),

          
          Expanded(
            flex: 2,
            child: _buildPerformance(),
          ),

        
          Expanded(
            flex: 2,
            child: _buildLastActivity(),
          ),

          
          Expanded(
            flex: 2,
            child: _buildStatus(),
          ),

          
          Expanded(
            flex: 3,
            child: _buildActions(),
          ),
        ],
      ),
    );
  }

  Widget _buildCaretakerInfo() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(caretaker.avatarUrl),
            backgroundColor: Colors.grey[300],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  caretaker.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1F1F1F),
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  caretaker.email,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAssignedTrees() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${caretaker.assignedTrees} trees',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Color(0xFF333333),
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 6),
          Wrap(
            spacing: 4,
            runSpacing: 4,
            children: caretaker.treeTypes
                .map((type) => CaretakerTreeChip(treeType: type))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildPerformance() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: caretaker.performance / 100,
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation<Color>(
                        _getPerformanceColor(caretaker.performance),
                      ),
                      minHeight: 6,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '${caretaker.performance}%',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: Color(0xFF333333),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLastActivity() {
    return Align(
      alignment: Alignment.center,
      child: Text(
        caretaker.lastActivity,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 13,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildStatus() {
    return Align(
      alignment: Alignment.center,
      child: CaretakerStatusChip(status: caretaker.status),
    );
  }

  Widget _buildActions() {
    return Align(
      alignment: Alignment.centerRight,
      child: CaretakerActionButtons(caretaker: caretaker),
    );
  }

  Color _getPerformanceColor(int performance) {
    if (performance > 90) {
      return const Color(0xFF4CAF50);
    } else if (performance > 70) {
      return const Color(0xFFFFC107);
    } else {
      return const Color(0xFFF44336);
    }
  }
}