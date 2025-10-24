import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_button.dart';

class CaretakerLoginScreen extends StatefulWidget {
  const CaretakerLoginScreen({Key? key}) : super(key: key);

  @override
  State<CaretakerLoginScreen> createState() => _CaretakerLoginScreenState();
}

class _CaretakerLoginScreenState extends State<CaretakerLoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _showPassword = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.lightGrey, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(isSmallScreen ? 16.0 : 24.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 400),
                child: Container(
                  padding: EdgeInsets.all(isSmallScreen ? 24 : 32),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Logo
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: AppColors.primaryGreen,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primaryGreen.withOpacity(0.3),
                              blurRadius: 15,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.eco,
                          color: AppColors.white,
                          size: 48,
                        ),
                      ),
                      SizedBox(height: 24),

                      // App Name
                      Text(
                        'CareTaker',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textTitle,
                        ),
                      ),
                      SizedBox(height: 8),

                      // Subtitle
                      Text(
                        'Plant Care Management',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textBody,
                        ),
                      ),
                      SizedBox(height: 32),

                      // Welcome Back
                      Text(
                        'Welcome Back',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textTitle,
                        ),
                      ),
                      SizedBox(height: 8),

                      // Subtitle
                      Text(
                        'Sign in to manage your plants',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.textBody,
                        ),
                      ),
                      SizedBox(height: 28),

                      // Username Field
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Username',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textTitle,
                            ),
                          ),
                          SizedBox(height: 8),
                          TextField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              hintText: 'Enter your username',
                              hintStyle: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 14,
                              ),
                              prefixIcon: Icon(
                                Icons.person_outline,
                                color: Colors.grey[400],
                                size: 20,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.grey[300]!,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.grey[300]!,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: AppColors.primaryGreen,
                                  width: 2,
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),

                      // Password Field
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Password',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textTitle,
                            ),
                          ),
                          SizedBox(height: 8),
                          TextField(
                            controller: _passwordController,
                            obscureText: !_showPassword,
                            decoration: InputDecoration(
                              hintText: 'Enter your password',
                              hintStyle: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 14,
                              ),
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: Colors.grey[400],
                                size: 20,
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _showPassword = !_showPassword;
                                  });
                                },
                                child: Icon(
                                  _showPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey[400],
                                  size: 20,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.grey[300]!,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.grey[300]!,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: AppColors.primaryGreen,
                                  width: 2,
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),

                      // Remember Me & Forgot Password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 24,
                                height: 24,
                                child: Checkbox(
                                  value: _rememberMe,
                                  onChanged: (value) {
                                    setState(() {
                                      _rememberMe = value ?? false;
                                    });
                                  },
                                  activeColor: AppColors.primaryGreen,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Remember me',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: AppColors.textBody,
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              // Navigate to forgot password
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size(0, 0),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.primaryGreen,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24),

                      // Sign In Button
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            print('Sign In pressed');
                            Navigator.of(context).pushNamed('/tree-dashboard');
                          },
                          icon: Icon(Icons.login),
                          label: Text('Sign In'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryGreen,
                            foregroundColor: AppColors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      // OR Divider
                      Row(
                        children: [
                          Expanded(child: Divider(color: Colors.grey[300])),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              'OR',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(child: Divider(color: Colors.grey[300])),
                        ],
                      ),
                      SizedBox(height: 20),

                      // Fingerprint Option
                      GestureDetector(
                        onTap: () {
                          // Handle fingerprint login
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Fingerprint login coming soon...'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.grey[300]!,
                                  width: 2,
                                ),
                              ),
                              child: Icon(
                                Icons.fingerprint,
                                color: Colors.grey[600],
                                size: 32,
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              'Use fingerprint',
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.textBody,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),

                      // Sign Up Link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              fontSize: 13,
                              color: AppColors.textBody,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // Navigate to sign up
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size(0, 0),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.primaryGreen,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
