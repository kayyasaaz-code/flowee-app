import 'package:flutter/material.dart';
import '../models/coffee.dart';
import '../state/favourite_controller.dart';
import '../theme/app_theme.dart';
import 'coffe_image.dart';

class CoffeCard extends StatelessWidget {
  const CoffeCard({
    super.key,
    required this.coffee,
    required this.onTap,
    this.onAddTap,
  });

  final Coffee coffee;
  final VoidCallback onTap;
  final VoidCallback? onAddTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(36),
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(36),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 1. Gambar Kopi Bulat + Tombol Favorite
            Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  height: 90,
                  width: 90,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(45),
                    child: Hero(
                      tag: 'coffee-image-${coffee.id}',
                      child: FlowerNetworkImage(
                        imageUrl: coffee.imageUrl,
                        fallbackIcon: coffee.icon,
                        fallbackColor: coffee.color,
                      ),
                    ),
                  ),
                ),

                // Tombol Favorite (Ikon Hati)
                Positioned(
                  top: -4,
                  right: -4,
                  child: ValueListenableBuilder<Set<String>>(
                    valueListenable: FavouriteController.instance,
                    builder: (context, favorites, _) {
                      final isFav = favorites.contains(coffee.id);

                      return GestureDetector(
                        onTap: () {
                          FavouriteController.instance.toggle(coffee.id);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.10),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Icon(
                            isFav
                                ? Icons.favorite_rounded
                                : Icons.favorite_border_rounded,
                            size: 16,
                            color: isFav
                                ? AppTheme.primary
                                : Colors.grey.shade400,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 6),

            // 2. Info Kopi (Nama, Subtitle/Kategori, Harga)
            Column(
              children: [
                Text(
                  coffee.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 14,
                    color: AppTheme.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  coffee.category,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  formatRupiah(coffee.price),
                  style: const TextStyle(
                    color: AppTheme.textPrimary,
                    fontWeight: FontWeight.w800,
                    fontSize: 14,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 6),

            // 3. Tombol (+) Pill Melengkung di Bagian Bawah
            InkWell(
              onTap: onAddTap ?? onTap,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: double.infinity,
                height: 32,
                decoration: BoxDecoration(
                  color: const Color(0xFFE2B062),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.add_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
