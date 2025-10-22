import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../features/blog/widgets/filter_chip_bar.dart';
import '../../../features/blog/widgets/article_list_item.dart';
import '../../../features/blog/widgets/featured_article_card.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({Key? key}) : super(key: key);

 
  Widget _buildArticleItem({
    required BuildContext context,
    required String title,
    required String author,
    required String tag,
    required Color tagColor,
    required String readTime,
    required String imageUrl,
  }) {
    return Column(
      children: [
        ArticleListItem(
          title: title,
          author: author,
          tag: tag,
          tagColor: tagColor,
          readTime: readTime,
          imageUrl: imageUrl,
          onTap: () {
            _showArticleDetail(context, title);
          },
        ),
        const Divider(indent: 16, endIndent: 16, color: AppColors.borderColor),
      ],
    );
  }

  void _showArticleDetail(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Opening: $title'),
        duration: const Duration(seconds: 1),
      ),
    );
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: AppColors.textTitle),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        title: const Text(
          'TreeInvest Blog',
          style: TextStyle(
            color: AppColors.textTitle,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: AppColors.textTitle),
            onPressed: () {
              _showSearch(context);
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          // Header Section
          Container(
            padding: const EdgeInsets.all(20.0),
            color: AppColors.blogHeaderGreen,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Grow Your Future',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Discover sustainable investment opportunities and environmental insights',
                  style: TextStyle(
                    color: AppColors.white70,
                    fontSize: 15,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 12.0),
                const Row(
                  children: [
                    Icon(Icons.article, color: AppColors.white70, size: 14),
                    SizedBox(width: 4.0),
                    Text(
                      '247 Articles',
                      style: TextStyle(color: AppColors.white70, fontSize: 12),
                    ),
                    SizedBox(width: 16.0),
                    Icon(Icons.update, color: AppColors.white70, size: 14),
                    SizedBox(width: 4.0),
                    Text(
                      'Updated Daily',
                      style: TextStyle(color: AppColors.white70, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),

   
          const FilterChipBar(),

        
          const FeaturedArticleCard(),
          const SizedBox(height: 16.0),

          _buildArticleItem(
            context: context,
            title: 'New EU Deforestation Laws Impact Global Investments',
            author: 'Michelle Liu',
            tag: 'Policy',
            tagColor: AppColors.tagPolicy,
            readTime: '3 min read',
            imageUrl: 'assets/images/policy.png', 
          ),
          _buildArticleItem(
            context: context,
            title: 'The Hidden Environmental Benefits of Urban Tree Planting',
            author: 'Dr. Emma Green',
            tag: 'Environment',
            tagColor: AppColors.tagEnvironment,
            readTime: '4 min read',
            imageUrl: 'assets/images/environment.png', 
          ),
          _buildArticleItem(
            context: context,
            title: 'Comparing Tree Investment ROIs: Tropical vs. Temperate Forests',
            author: 'James Wilson',
            tag: 'Investment',
            tagColor: AppColors.tagInvestment,
            readTime: '6 min read',
            imageUrl: 'assets/images/investment_roi.png', 
          ),
          _buildArticleItem(
            context: context,
            title: 'Climate Resilience: Future-Proofing Your Forest Investments',
            author: 'Alex Rivera',
            tag: 'Climate',
            tagColor: AppColors.tagClimate,
            readTime: '5 min read',
            imageUrl: 'assets/images/climate.png',
          ),
          _buildArticleItem(
            context: context,
            title: 'AI-Powered Forest Management: The Future of Tree Investing',
            author: 'Tech Analyst',
            tag: 'Technology',
            tagColor: AppColors.tagTechnology,
            readTime: '4 min read',
            imageUrl: 'assets/images/technology.png',
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: OutlinedButton.icon(
              onPressed: () {
                _loadMoreArticles(context);
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Load More Articles'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.primaryGreen,
                side: const BorderSide(color: AppColors.primaryGreen),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSearch(BuildContext context) {
    showSearch(
      context: context,
      delegate: _ArticleSearchDelegate(),
    );
  }

  void _loadMoreArticles(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Loading more articles...'),
        duration: Duration(seconds: 1),
      ),
    );
    // TODO: Implement load more functionality
  }
}

// Simple search delegate
class _ArticleSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text('Search results for: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('Type to search articles...'),
    );
  }
}