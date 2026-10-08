import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.onQueryChanged,
    this.bannerWidget,
    this.onFavoriteTap,
    this.onProfileTap,
  });

  final ValueChanged<String> onQueryChanged;
  final Widget? bannerWidget;
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onProfileTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: double.infinity,
          color: const Color(0xFF60212D),
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Location',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.6),
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: const [
                          Text(
                            'Bilzen, Tanjungbalai',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.white,
                            size: 18,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: onFavoriteTap,
                        icon: const Icon(
                          Icons.favorite_outline_rounded,
                          color: Colors.white,
                          size: 24,
                        ),
                        tooltip: 'Favorite',
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: onProfileTap,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.white.withValues(alpha: 0.2),
                          child: const Icon(
                            Icons.person_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: TextField(
                        onChanged: onQueryChanged,
                        cursorColor: const Color(0xFF60212D),
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Search coffee',
                          hintStyle: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 14,
                          ),
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: Colors.grey.shade700,
                            size: 21,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFFC67C4E),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.tune_rounded, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
        if (bannerWidget != null)
          Positioned(top: 155, left: 20, right: 20, child: bannerWidget!),
      ],
    );
  }
}
