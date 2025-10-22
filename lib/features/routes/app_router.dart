import 'package:flutter/material.dart';
import 'package:tree_marketplace_app/features/blog/screens/blog_screen.dart';
import 'package:tree_marketplace_app/features/main_navigation/screens/main_navigation_screen.dart';
import '../auth/screens/login_screen.dart';
import '../dashboard/screens/dashboard_screen.dart';
import '../referral_Program/screens/referral_Program.dart';
import '../my_wallet/screens/my_wallet_screen.dart';
import '../support/screens/support_screen.dart';
import '../testimonials/screens/testimonials_screen.dart';


class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/dashboard':
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
        case '/referralprogram':
        return MaterialPageRoute(builder: (_) => const ReferralProgramScreen());
        case '/my_wallet':
        return MaterialPageRoute(builder: (_) => const MyWalletScreen());
        case '/support':
        return MaterialPageRoute(builder: (_) => const SupportScreen());
        case '/testimonials':
        return MaterialPageRoute(builder: (_) => const UserTestimonialsPage());
        case '/main_navigation':
        return MaterialPageRoute(builder: (_) => const MainNavigationScreen());

     
      default:
        return MaterialPageRoute(
            builder: (_) => const LoginScreen());
    }
  }
}
