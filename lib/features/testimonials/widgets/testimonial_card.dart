import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../testimonials/widgets/star_rating_display.dart';

class TestimonialCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String title;
  final int rating;
  final String reviewText;
  final String timestamp;

  const TestimonialCard({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.title,
    required this.rating,
    required this.reviewText,
    required this.timestamp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage(imageUrl),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: AppColors.textTitle,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 2.0),
                    Text(
                      title,
                      style: const TextStyle(
                        color: AppColors.textBody,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    StarRatingDisplay(rating: rating),
                  ],
                ),
              ),
              const Icon(
                Icons.format_quote,
                color: AppColors.quoteIconColor,
                size: 32,
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Text(
            reviewText,
            style: const TextStyle(
              color: AppColors.textBody,
              fontSize: 14,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                timestamp,
                style: const TextStyle(
                  color: AppColors.textBody,
                  fontSize: 12,
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.thumb_up,
                    size: 16, color: AppColors.completedGreen),
                label: const Text(
                  'Helpful',
                  style: TextStyle(
                    color: AppColors.completedGreen,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: TextButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
