import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoryChipList extends StatelessWidget {
  const CategoryChipList({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
    this.onSeeAllTap,
  });

  final List<Category> categories;
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;
  final VoidCallback? onSeeAllTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header: Categories & See All
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              GestureDetector(
                onTap: onSeeAllTap,
                child: const Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFFC67C4E), // Aksen Karamel
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),

        // Horizontal Circular Icon Category List
        SizedBox(
          height: 95,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: categories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 18),
            itemBuilder: (context, index) {
              final category = categories[index];
              final isSelected = category.name == selectedCategory;

              return GestureDetector(
                onTap: () => onCategorySelected(category.name),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 60,
                      height: 60,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF60212D)
                            : const Color(0xFFF7F4F2),
                        shape: BoxShape.circle,
                        border: isSelected
                            ? Border.all(
                                color: const Color(0xFFC67C4E),
                                width: 2,
                              )
                            : null,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Image.network(
                        category.iconPath,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) => Icon(
                          Icons.fastfood_rounded,
                          color: isSelected
                              ? Colors.white
                              : const Color(0xFF8D8078),
                          size: 24,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Label Nama Kategori
                    Text(
                      category.name,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.w500,
                        color: isSelected
                            ? const Color(0xFF60212D)
                            : Colors.black87,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
