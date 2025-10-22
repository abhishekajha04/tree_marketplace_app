import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../blog/screens/blog_screen.dart';
import '../../profile/screens/profile_screen.dart';
import '../../saved/screens/saved_screen.dart';
import '../../trends/screens/trends_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  static const routeName = '/main-nav';

  const MainNavigationScreen({Key? key}) : super(key: key);

  @override
  _MainNavigationScreenState createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;


  static const List<Widget> _widgetOptions = <Widget>[
    BlogScreen(),    
    SavedScreen(),
    TrendsScreen(), 
    ProfileScreen(), 
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            activeIcon: Icon(Icons.bookmark),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            activeIcon: Icon(Icons.trending_up),
            label: 'Trends',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primaryGreen,
        unselectedItemColor: AppColors.textBody,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, 
        showUnselectedLabels: true,
        backgroundColor: AppColors.white,
        elevation: 2.0,
      ),
    );
  }
}

