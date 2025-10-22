import 'package:flutter/material.dart';
import 'features/routes/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TreeMarket Pro',
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: '/main_navigation', ///testimonials , support , my_wallet , referralprogram 
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
    );
  }
}
