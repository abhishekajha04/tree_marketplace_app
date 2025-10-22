import '../../../core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class FeaturedArticleCard extends StatelessWidget {
  const FeaturedArticleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        image: const DecorationImage(
          image: AssetImage('assets/images/img.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black.withOpacity(0.8), Colors.transparent],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.translucentBlack,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: const Text(
                'Featured',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 120),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.tagInvestment,
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: const Text('Investment',
                  style: TextStyle(color: AppColors.white, fontSize: 12)),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'How Carbon Credit Markets Are Revolutionizing Tree Investment Returns',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                const CircleAvatar(
                  radius: 12,
                  backgroundImage: AssetImage('assets/images/climate.png'),
                ),
                const SizedBox(width: 8.0),
                const Text(
                  'Sarah Chen',
                  style: TextStyle(color: AppColors.white70, fontSize: 13),
                ),
                const Spacer(),
                const Icon(Icons.favorite, color: AppColors.white70, size: 16),
                const SizedBox(width: 4.0),
                const Text(
                  '124',
                  style: TextStyle(color: AppColors.white70, fontSize: 13),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}