import 'package:flutter/material.dart';
import 'package:tree_marketplace_app/core/constants/app_colors.dart';
import 'package:tree_marketplace_app/core/widgets/custom_button.dart';
import 'package:tree_marketplace_app/features/tree_mobile_UI/widgets/CustomTextField.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGreenBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildTopSection(),
            const SizedBox(height: 30),
            _buildBottomSection(),
          ],
        ),
      ),
    );
  }

  // --- Top Section ---
  Widget _buildTopSection() {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 80.0, bottom: 30.0),
        child: Column(
          children: [
            SizedBox(
              height: 128,
              width: 128,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: const AssetImage('assets/images/login.png'),
                onBackgroundImageError: (_, __) {},
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Welcome Back',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textTitle,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Sign in to continue your journey',
              style: TextStyle(fontSize: 16, color: AppColors.textBody),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/signinbanner.png',
              height: 192,
              width: 327,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => const SizedBox(
                height: 192,
                child: Center(child: Text('Image not available')),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Bottom Section ---
  Widget _buildBottomSection() {
    return Container(
      width: 327,
      constraints: const BoxConstraints(minHeight: 490),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(24.0)),
      ),
      transform: Matrix4.translationValues(0.0, -20.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CustomTextField(
              label: 'Email or Phone',
              hint: 'Enter email or phone',
              prefixIcon: Icons.email_outlined,
            ),
            const SizedBox(height: 16),
            const CustomTextField(
              label: 'Password',
              hint: 'Enter password',
              prefixIcon: Icons.lock_outline,
              suffixIcon: Icons.visibility_off_outlined,
              isPassword: true,
            ),
            const SizedBox(height: 16),
            _buildRememberMeRow(),
            const SizedBox(height: 18),
            CustomButton(text: 'Sign In', onPressed: () {}),
            const SizedBox(height: 24),
            const Text(
              'Or continue with',
              style: TextStyle(color: AppColors.textBody),
            ),
            const SizedBox(height: 16),
            _buildSocialLoginRow(),
            const SizedBox(height: 20),
            _buildSignUpRow(),
          ],
        ),
      ),
    );
  }

  // --- Remember Me Row ---
  Widget _buildRememberMeRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              height: 20,
              child: Checkbox(
                value: false,
                onChanged: (val) {},
                activeColor: AppColors.primaryGreen,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
            const SizedBox(width: 4),
            const Text(
              'Remember me',
              style: TextStyle(color: AppColors.textBody),
            ),
          ],
        ),
        Text(
          'Forgot password?',
          style: TextStyle(
            color: AppColors.primaryGreen,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // --- Social Login Row ---
  Widget _buildSocialLoginRow() {
    return Row(
      children: [
        Expanded(
          child: _socialButton(imageAsset: 'assets/images/google11.png'),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _socialButton(imageAsset: 'assets/images/appleicons.png'),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _socialButton(imageAsset: 'assets/images/facebook.png'),
        ),
      ],
    );
  }

  // --- Social Button ---
  Widget _socialButton({IconData? icon, String? imageAsset}) {
    return SizedBox(
      height: 50,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          side: const BorderSide(color: AppColors.textFieldBorder),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Icon(icon, size: 24, color: AppColors.textTitle),
            if (imageAsset != null)
              Image.asset(
                imageAsset,
                height: 24,
                width: 24,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.image_not_supported, size: 24),
              ),
          ],
        ),
      ),
    );
  }

  // --- Sign-Up Row ---
  Widget _buildSignUpRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          "Don't have an account? ",
          style: TextStyle(color: AppColors.textBody),
        ),
        Text(
          'Sign up',
          style: TextStyle(
            color: AppColors.primaryGreen,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
