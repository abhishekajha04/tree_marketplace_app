import '../../../core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ArticleListItem extends StatelessWidget {
  final String title;
  final String author;
  final String tag;
  final Color tagColor;
  final String readTime;
  final String imageUrl;
  final VoidCallback? onTap;
  final VoidCallback? onBookmark;
  final bool isBookmarked;
  final double imageWidth;
  final double imageHeight;
  final bool showBookmarkIcon;

  const ArticleListItem({
    Key? key,
    required this.title,
    required this.author,
    required this.tag,
    required this.tagColor,
    required this.readTime,
    required this.imageUrl,
    this.onTap,
    this.onBookmark,
    this.isBookmarked = false,
    this.imageWidth = 100,
    this.imageHeight = 100,
    this.showBookmarkIcon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tag and read time
                  _buildMetaInfo(),
                  const SizedBox(height: 8.0),
                  // Title
                  _buildTitle(),
                  const SizedBox(height: 8.0),
                  // Author and bookmark
                  _buildFooter(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Image.asset(
        imageUrl,
        width: imageWidth,
        height: imageHeight,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: imageWidth,
            height: imageHeight,
            decoration: BoxDecoration(
              color: AppColors.textBody.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Icon(
              Icons.article_outlined,
              color: AppColors.textBody.withOpacity(0.3),
              size: 32,
            ),
          );
        },
      ),
    );
  }

  Widget _buildMetaInfo() {
    return Row(
      children: [
        // Tag
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: tagColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Text(
            tag.toUpperCase(),
            style: TextStyle(
              color: tagColor,
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ),
        const SizedBox(width: 8.0),
        // Read time
        Text(
          readTime,
          style: const TextStyle(
            color: AppColors.textBody,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Text(
      title,
      style: const TextStyle(
        color: AppColors.textTitle,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        height: 1.3,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildFooter() {
    return Row(
      children: [
        // Author icon and name
        const Icon(
          Icons.person_outline,
          size: 14,
          color: AppColors.textBody,
        ),
        const SizedBox(width: 4.0),
        Expanded(
          child: Text(
            author,
            style: const TextStyle(
              color: AppColors.textBody,
              fontSize: 12,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        // Bookmark icon
        if (showBookmarkIcon) ...[
          const SizedBox(width: 8.0),
          GestureDetector(
            onTap: onBookmark,
            child: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              size: 16,
              color: isBookmarked ? AppColors.primaryGreen : AppColors.textBody,
            ),
          ),
        ],
      ],
    );
  }
}