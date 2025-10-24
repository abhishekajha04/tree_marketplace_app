import 'package:flutter/material.dart';
import 'package:tree_marketplace_app/features/auth/screens/SignInScreen.dart';
import 'package:tree_marketplace_app/features/tree_mobile_UI/screens/HomeScreen.dart';
import 'package:tree_marketplace_app/features/tree_mobile_UI/screens/SellTreesScreen.dart';
import 'package:tree_marketplace_app/features/tree_mobile_UI/screens/TreeDetailsScreen.dart';
import 'package:tree_marketplace_app/features/tree_mobile_UI/screens/TreeMarketScreen.dart';
import 'package:tree_marketplace_app/features/tree_mobile_UI/screens/my_garden_screen.dart';
import 'package:tree_marketplace_app/features/tree_mobile_UI/screens/my_trees_screen.dart';
import 'package:tree_marketplace_app/features/tree_mobile_UI/screens/tree_tracker_screen.dart';
import '../auth/screens/login_screen.dart';
import '../dashboard/screens/dashboard_screen.dart';
import 'package:tree_marketplace_app/features/tree_mobile_UI/screens/OnboardingScreen.dart';
import 'package:tree_marketplace_app/features/auth/screens/login_screen.dart';
// Import other screens as needed

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/dashboard':
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case '/onboardingscreen':
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case '/signInscreen':
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case '/homescreen':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/treemarketscreen':
        return MaterialPageRoute(builder: (_) => const TreeMarketScreen());
      case '/treedetailsscreen':
        return MaterialPageRoute(builder: (_) => const TreeDetailsScreen());
      case '/mytreesscreen':
        return MaterialPageRoute(builder: (_) => const MyTreesScreen());
      case '/treetrackerscreen':
        return MaterialPageRoute(builder: (_) => const TreeTrackerScreen());
      case '/mygardenscreen':
        return MaterialPageRoute(builder: (_) =>   MyGardenScreen());
      case '/selltreesscreen':
        return MaterialPageRoute(builder: (_) =>   SellTreesScreen());
      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}
