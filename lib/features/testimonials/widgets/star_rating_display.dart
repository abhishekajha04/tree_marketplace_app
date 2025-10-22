import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class StarRatingDisplay extends StatelessWidget {
  final int rating;
  final double size;

  const StarRatingDisplay({
    Key? key,
    this.rating = 5,
    this.size = 16.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: AppColors.starYellow,
          size: size,
        );
      }),
    );
  }
}
