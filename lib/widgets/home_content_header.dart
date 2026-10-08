import 'package:flutter/material.dart';
import 'banner_carousel.dart';
import '../data/dummy_data.dart';

class HomeContentHeader extends StatelessWidget {
  const HomeContentHeader({
    super.key,
    required this.onQueryChanged,
    this.onProfileTap,
    this.onFilterTap,
  });

  final ValueChanged<String> onQueryChanged;
  final VoidCallback? onProfileTap;
  final VoidCallback? onFilterTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // 1. Container Background Cokelat Tua
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(
            20,
            20,
            20,
            95,
          ), // Padding bawah buat memberi ruang untuk banner
          decoration: const BoxDecoration(color: Color(0xFF60212D)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Location Info
              const Text(
                'Location',
                style: TextStyle(fontSize: 12, color: Colors.white54),
              ),
              const SizedBox(height: 4),
              Row(
                children: const [
                  Text(
                    'Bilzen, Tanjungbalai',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.white70,
                    size: 20,
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Search Bar + Filter Icon Button
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: onQueryChanged,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Search coffee',
                        hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 14,
                        ),
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          color: Colors.white.withOpacity(0.7),
                        ),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.12),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Tombol Filter
                  InkWell(
                    onTap: onFilterTap,
                    borderRadius: BorderRadius.circular(14),
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFF813342),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(
                        Icons.tune_rounded,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // 2. Banner Overlapping di Bawah Container
        Positioned(
          left: 20,
          right: 20,
          bottom: -60,
          child: BannerCarousel(banners: dummyBanners),
        ),
      ],
    );
  }
}
