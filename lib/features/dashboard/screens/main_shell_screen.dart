import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import 'tree_dashboard_screen.dart';
import '../../../features/tree_management/screens/tree_update_screen.dart';
import 'performance_dashboard_screen.dart';
import '../../user_management/screens/activity_log_screen.dart';

class MainShellScreen extends StatefulWidget {
  final int initialIndex;

  const MainShellScreen({
    super.key,
    this.initialIndex = 0,
  });

  @override
  State<MainShellScreen> createState() => _MainShellScreenState();
}

class _MainShellScreenState extends State<MainShellScreen> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScreen(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.primaryGreen,
        unselectedItemColor: Colors.grey[400],
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildScreen(int index) {
    switch (index) {
      case 0:
        return TreeDashboardScreen(
          onNavigate: (screenIndex) {
            setState(() {
              _selectedIndex = screenIndex;
            });
          },
        );
      case 1:
        return AddTreeScreen();
      case 2:
        return PerformanceDashboardScreen(
          onNavigate: (screenIndex) {
            setState(() {
              _selectedIndex = screenIndex;
            });
          },
        );
      case 3:
        return ActivityLogScreen();
      default:
        return TreeDashboardScreen(
          onNavigate: (screenIndex) {
            setState(() {
              _selectedIndex = screenIndex;
            });
          },
        );
    }
  }
}

// Simple Add Tree Screen
class AddTreeScreen extends StatelessWidget {
  const AddTreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_circle_outline,
                size: 80,
                color: AppColors.primaryGreen,
              ),
              SizedBox(height: 24),
              Text(
                'Add New Tree',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textTitle,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'Add tree details here',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textBody,
                ),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Add tree form coming soon')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryGreen,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: Text(
                  'Start Adding',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}