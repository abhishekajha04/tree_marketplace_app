import 'package:flutter/material.dart';
import '../auth/screens/login_screen.dart';
import '../auth/screens/caretaker_login_screen.dart';
import '../dashboard/screens/dashboard_screen.dart';
import '../dashboard/screens/tree_dashboard_screen.dart';
import '../dashboard/screens/performance_dashboard_screen.dart';
import '../dashboard/screens/notifications_screen.dart';
import '../dashboard/screens/main_shell_screen.dart';
import '../tree_management/screens/tree_update_screen.dart';
import '../user_management/screens/activity_log_screen.dart';
// Import other screens as needed

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/caretaker-login-screen':
        return MaterialPageRoute(builder: (_) => const CaretakerLoginScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/dashboard':
        return MaterialPageRoute(builder: (_) => MainShellScreen(initialIndex: 0));
      case '/tree-dashboard':
        return MaterialPageRoute(builder: (_) => MainShellScreen(initialIndex: 0));
      case '/add':
        return MaterialPageRoute(builder: (_) => MainShellScreen(initialIndex: 1));
      case '/performance-dashboard':
        return MaterialPageRoute(builder: (_) => MainShellScreen(initialIndex: 2));
      case '/reports':
        return MaterialPageRoute(builder: (_) => MainShellScreen(initialIndex: 2));
      case '/tree-update':
        final args = settings.arguments as Map<String, String>;
        return MaterialPageRoute(
          builder: (_) => TreeUpdateScreen(
            treeId: args['treeId'] ?? '',
            treeName: args['treeName'] ?? '',
            plantedDate: args['plantedDate'] ?? '',
          ),
        );
      case '/notifications':
        return MaterialPageRoute(builder: (_) => const NotificationsScreen());
      case '/activity-log':
        return MaterialPageRoute(builder: (_) => MainShellScreen(initialIndex: 3));
      case '/profile':
        return MaterialPageRoute(builder: (_) => MainShellScreen(initialIndex: 3));
      default:
        return MaterialPageRoute(
            builder: (_) => const CaretakerLoginScreen());
    }
  }
}
