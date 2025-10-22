import '../../../core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import '../../testimonials/widgets/star_rating_display.dart';
import '../../testimonials/widgets/stat_item.dart';
import '../../testimonials/widgets/testimonial_card.dart';

class UserTestimonialsPage extends StatelessWidget {
  static const routeName = '/testimonials';

  const UserTestimonialsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.testimonialsBackground,
      appBar: AppBar(
        backgroundColor: AppColors.testimonialsBackground,
        elevation: 0,
        leading: const BackButton(color: AppColors.textTitle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              // --- Header ---
              const Text(
                'What Our Users Say',
                style: TextStyle(
                  color: AppColors.textTitle,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Real stories from real people',
                style: TextStyle(color: AppColors.textBody, fontSize: 16),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const StarRatingDisplay(rating: 5, size: 20),
                  const SizedBox(width: 8.0),
                  const Text(
                    '4.9',
                    style: TextStyle(
                      color: AppColors.textTitle,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const Text(
                    ' (2,847 reviews)',
                    style: TextStyle(color: AppColors.textBody, fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),

              // --- Testimonial Cards ---
              const TestimonialCard(
                imageUrl: 'assets/images/sarah.png', // Example path
                name: 'Sarah Johnson',
                title: 'Marketing Director',
                rating: 5,
                reviewText:
                    'This app completely transformed how I manage my daily tasks. The interface is intuitive and the features are exactly what I needed. I\'ve recommended it to my entire team!',
                timestamp: '2 days ago',
              ),
              const TestimonialCard(
                imageUrl: 'assets/images/mike.png', // Example path
                name: 'Michael Chen',
                title: 'Software Engineer',
                rating: 5,
                reviewText:
                    'As a developer, I appreciate clean, well-designed software. This app exceeds expectations with its smooth performance and thoughtful UX design.',
                timestamp: '1 week ago',
              ),
              const TestimonialCard(
                imageUrl: 'assets/images/emily.png', // Example path
                name: 'Emily Rodriguez',
                title: 'Small Business Owner',
                rating: 5,
                reviewText:
                    'Running a small business means wearing many hats. This app helps me stay organized and focused on what matters most. The customer support is also fantastic!',
                timestamp: '3 days ago',
              ),
              const TestimonialCard(
                imageUrl: 'assets/images/david.png', // Assumed new asset
                name: 'David Kim',
                title: 'Product Manager',
                rating: 5,
                reviewText:
                    'I\'ve tried countless productivity apps, but this one stands out. The feature set is comprehensive yet simple to use. It\'s become an essential part of my workflow.',
                timestamp: '5 days ago',
              ),

              // --- Stats Section ---
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24.0),
                child: Row(
                  children: [
                    StatItem(value: '98%', label: 'Satisfaction Rate'),
                    SizedBox(width: 12),
                    StatItem(value: '50K+', label: 'Happy Users'),
                    SizedBox(width: 12),
                    StatItem(value: '4.9', label: 'App Store Rating'),
                  ],
                ),
              ),

              // --- CTA Section ---
              Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonGreen,
                        minimumSize: const Size(double.infinity, 55),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Join Thousands of Happy Users',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    const Text(
                      'Free 14-day trial • No credit card required',
                      style: TextStyle(color: AppColors.textBody, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

