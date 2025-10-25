import 'package:flutter/material.dart';
import '../auth/screens/adminLogin_screen.dart';
import '../AdminDashboard/screens/dashboard_screen.dart';
import '../tree_management/screens/tree_management_screen.dart';
import '../user_management/screens/user_management_screen.dart';
import '../user_panel/screens/user_profile_screen.dart';
import '../caretaker_dashboard/screens/caretaker_dashboard_screen.dart';
import '../Transaction/screens/transaction_screen.dart';
import '../analytics_dashboard/screens/analytics_dashboard_screen.dart';
import '../notifications_center/screens/notifications_center_screen.dart';


class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/adminLogin':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/adminDashboard':
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case '/treemanagement':
        return MaterialPageRoute(builder: (_) =>  TreeManagementScreen());
      case '/userManagement':
        return MaterialPageRoute(builder: (_) =>  UserManagementScreen());
      case '/UserProfile':
        return MaterialPageRoute(builder: (_) =>  UserProfileScreen());
      case '/caretakerDashboard':
        return MaterialPageRoute(builder: (_) =>  CaretakerDashboardScreen());
      case '/transaction':
        return MaterialPageRoute(builder: (_) =>  TransactionScreen());
      case '/analyticsDashboard':
        return MaterialPageRoute(builder: (_) =>  AnalyticsDashboardScreen());
      case '/notificationsCenter':
        return MaterialPageRoute(builder: (_) =>  NotificationsCenterScreen());
     
      default:
        return MaterialPageRoute(
            builder: (_) => const LoginScreen());
    }
  }
}
