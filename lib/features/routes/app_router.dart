import 'package:flutter/material.dart';
import '../auth/screens/login_screen.dart';
import '../dashboard/screens/dashboard_screen.dart';
// Import other screens as needed

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/dashboard':
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
     
      default:
        return MaterialPageRoute(
            builder: (_) => const LoginScreen());
    }
  }
}
