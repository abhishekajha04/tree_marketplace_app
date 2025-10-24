import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Left Panel - Info and Branding
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primaryGreen, AppColors.primaryGreenDark],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(48),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.white.withOpacity(0.12),
                      child: Icon(Icons.park, size: 48, color: AppColors.white),
                      radius: 36,
                    ),
                    SizedBox(height: 32),
                    Text(
                      "TreeMarket Pro",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Your comprehensive platform for managing tree inventory, sales, and marketplace operations",
                      style: TextStyle(color: AppColors.white70, fontSize: 18),
                    ),
                    SizedBox(height: 24),
                    _FeatureItem(
                      icon: Icons.show_chart,
                      title: "Advanced Analytics",
                      subtitle: "Track sales, inventory, and market trends",
                    ),
                    _FeatureItem(
                      icon: Icons.inventory_2,
                      title: "Inventory Management",
                      subtitle: "Manage your tree stock efficiently",
                    ),
                    _FeatureItem(
                      icon: Icons.people_alt,
                      title: "Customer Management",
                      subtitle: "Build lasting relationships with buyers",
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Right Panel - Login Form
          Expanded(
            flex: 3,
            child: Container(
              color: AppColors.white,
              child: Center(
                child: Container(
                  width: 400,
                  padding: EdgeInsets.symmetric(vertical: 48, horizontal: 32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Welcome Back",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Sign in to your admin dashboard",
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                      SizedBox(height: 32),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Email Address",
                          prefixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                          prefixIcon: Icon(Icons.lock_outline),
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.visibility_off),
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Checkbox(value: false, onChanged: (val) {}),
                          Text("Remember me"),
                          Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: Text("Forgot password?"),
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: CustomButton(
                          text: "Sign In to Dashboard",
                          icon: Icons.arrow_forward,
                          onPressed: () {
                            Navigator.pushNamed(context, '/dashboard');
                          },
                        ),
                      ),
                      SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(onPressed: () {}, child: Text("Support")),
                          Text(" | "),
                          TextButton(
                            onPressed: () {},
                            child: Text("Documentation"),
                          ),
                          Text(" | "),
                          TextButton(onPressed: () {}, child: Text("Contact")),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _FeatureItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.white.withOpacity(0.18),
            child: Icon(icon, color: AppColors.white, size: 18),
            radius: 20,
          ),
          SizedBox(width: 18),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(color: AppColors.white70, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
