// lib/tree_market_screen.dart
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:tree_marketplace_app/core/constants/app_colors.dart';
import 'package:tree_marketplace_app/features/tree_mobile_UI/widgets/CustomBottomNavBar.dart';

class TreeMarketScreen extends StatefulWidget {
  const TreeMarketScreen({Key? key}) : super(key: key);

  @override
  _TreeMarketScreenState createState() => _TreeMarketScreenState();
}

class _TreeMarketScreenState extends State<TreeMarketScreen> {
  int _currentIndex = 0;
  int _selectedFilterIndex = 0;

  // ✅ FIX 1: Updated image paths to point to local assets folder.
  // Make sure you have these images in your `assets/images/` folder.
  final List<Map<String, dynamic>> treeData = [
    {
      "name": "Apple Tree",
      "description": "Malus domestica • 3-5 years to fruit",
      "price": 45,
      "rating": 5.0,
      "reviewCount": 304,
      "imageUrl": "assets/images/Apple.png", // Correct path
      "isFavorite": true,
    },
    {
      "name": "Oak Tree",
      "description": "Quercus robur • 10-20 years to mature",
      "price": 125,
      "rating": 4.5,
      "reviewCount": 189,
      "imageUrl": "assets/images/Oak.png", // Correct path
      "isFavorite": false,
    },
    {
      "name": "Cherry Blossom",
      "description": "Prunus serrulata • 3-7 years to bloom",
      "price": 65,
      "rating": 5.0,
      "reviewCount": 732,
      "imageUrl": "assets/images/Cherry.png", // Correct path
      "isFavorite": false,
    },
     {
      "name": "Lemon Tree",
      "description": "Citrus limon • 2-4 years to fruit",
      "price": 55,
      "rating": 4.0,
      "reviewCount": 209,
      "imageUrl": "assets/images/Lemon.png", // Correct path
      "isFavorite": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            _buildSearchBar(),
            const SizedBox(height: 25),
            _buildFilterChips(),
            const SizedBox(height: 25),
            _buildSortBar(),
            const SizedBox(height: 25),
            _buildTreeList(),
             const SizedBox(height: 20),
          ],
        ),
      ),
      
        // Correct placement for the Bottom Navigation Bar
      bottomNavigationBar: CustomBottomNavBar(
        // <-- MOVED HERE
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  // --- UI Building Methods ---

  PreferredSizeWidget _buildAppBar() {
  return AppBar(
    backgroundColor: AppColors.white,
    elevation: 0,
    leading: IconButton(
      icon: const Icon(Icons.menu, color: AppColors.textTitle),
      onPressed: () {},
    ),
    titleSpacing: 0, // ensures title is tight to the left
    centerTitle: false, // 👈 this moves the title to the left
    title: const Text(
      'TreekMarket',
      style: TextStyle(
        color: AppColors.textTitle,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    ),
    actions: [
      IconButton(
        icon: const Icon(Icons.favorite_border, color: AppColors.textBody),
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(Icons.shopping_cart_outlined, color: AppColors.textBody),
        onPressed: () {},
      ),
    ],
     bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        height: 1,
        color: AppColors.borderColor, // or Colors.grey.shade300
      ),
    ),
  );
}

  Widget _buildSearchBar() {
  return SizedBox(
    width: 255,  // 👈 fixed width
    height: 44,  // 👈 fixed height
    child: TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: const TextStyle(color: AppColors.textBody),
        prefixIcon: const Icon(Icons.search, color: AppColors.textBody),
        filled: true,
        fillColor: AppColors.lightGrey,
        contentPadding: const EdgeInsets.symmetric(vertical: 12.0), // adjust for height
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primaryGreen),
        ),
      ),
    ),
  );
}


Widget _buildFilterChips() {
  final filters = ["All trees", "Fruit Trees", "Shade Trees"];
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 36,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: filters.length,
          separatorBuilder: (context, index) => const SizedBox(width: 8),
          itemBuilder: (context, index) {
            bool isSelected = _selectedFilterIndex == index;
            return ChoiceChip(
              label: Text(filters[index]),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) {
                  setState(() {
                    _selectedFilterIndex = index;
                  });
                }
              },
              backgroundColor: AppColors.filterChipBackground,
              selectedColor: AppColors.activeFilterChipBackground,
              labelStyle: TextStyle(
                color: isSelected ? AppColors.activeFilterChipTextColor : AppColors.textBody,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: isSelected ? AppColors.primaryGreen : Colors.transparent,
                  width: 1,
                ),
              ),
              avatar: isSelected
                  ? const Icon(Icons.check, color: AppColors.activeFilterChipTextColor, size: 14)
                  : null,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            );
          },
        ),
      ),
      // 👇 Thin underline divider
      Container(
        margin: const EdgeInsets.only(top: 15),
        // width: double.infinity,
        height: 2,
        color: AppColors.borderColor, // or Colors.grey.shade300
      ),
    ],
  );
}


  Widget _buildSortBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          '248 trees available',
          style: TextStyle(color: AppColors.textBody, fontSize: 14),
        ),
        Row(
          children: const [
            Text(
              'Sort by',
              style: TextStyle(color: AppColors.textBody, fontSize: 14),
            ),
            Icon(Icons.expand_more, color: AppColors.textBody, size: 20),
          ],
        ),
      ],
    );
  }

  Widget _buildTreeList() {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: treeData.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return _buildTreeCard(treeData[index]);
      },
    );
  }

  Widget _buildTreeCard(Map<String, dynamic> tree) {
  return Container(
    width: 341,
    
  padding: const EdgeInsets.only(bottom: 16), // 👈 Bottom padding added here
  decoration: BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: AppColors.borderColor),
  ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                // ✅ FIX 2: Changed Image.network to Image.asset
                child: Image.asset(
                  tree['imageUrl'],
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  // Optional: Add an error builder for robustness
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 180,
                      color: AppColors.lightGrey,
                      child: const Icon(
                        Icons.image_not_supported,
                        color: AppColors.textBody,
                        size: 50,
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white54,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(
                      tree['isFavorite'] ? Icons.favorite : Icons.favorite_border,
                      color: tree['isFavorite'] ? Colors.red : AppColors.textTitle,
                    ),
                    onPressed: () {
                      setState(() {
                         tree['isFavorite'] = !tree['isFavorite'];
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tree['name'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: AppColors.textTitle,
                      ),
                    ),
                    Text(
                      '\$${tree['price']}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: AppColors.primaryGreen,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  tree['description'],
                  style: const TextStyle(color: AppColors.textBody, fontSize: 13),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.star, color: AppColors.starColor, size: 18),
                    const Icon(Icons.star, color: AppColors.starColor, size: 18),
                    const Icon(Icons.star, color: AppColors.starColor, size: 18),
                    const Icon(Icons.star, color: AppColors.starColor, size: 18),
                    const Icon(Icons.star_half, color: AppColors.starColor, size: 18),
                    const SizedBox(width: 8),
                    Text(
                      '(${tree['reviewCount']})',
                      style: const TextStyle(color: AppColors.textBody, fontSize: 13),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 38,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.buttonGreen,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                            )
                        ),
                        child: const Text('See form'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  
}