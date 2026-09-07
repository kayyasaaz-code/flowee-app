import 'package:flowee_app/models/flower.dart';
import 'package:flowee_app/state/favourite_controller.dart';
import 'package:flowee_app/theme/app_theme.dart';
import 'package:flowee_app/widgets/flower_image.dart';
import 'package:flutter/material.dart';

class FlowerCard extends StatelessWidget {
  const FlowerCard({super.key, required this.flower, required this.onTap});

  final Flower flower;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primaryDark.withValues(alpha: 0.8),
              blurRadius: 16,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .stretch, //akan menarik sebuah objek unutk memnuhi container yang ada
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    child: Hero(
                      tag: 'flower-image-${flower.id}',
                      child: FlowerNetworkImage(
                        imageUrl: flower.imageUrl,
                        fallbackIcon: flower.icon,
                        fallbackColor: flower.color,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: _RatingChip(
                      rating: flower.rating,
                    ), //buat manggil rating nya
                  ), //unutk pemanggilan rating chip
                  //untuk handling favourite button
                  Positioned(
                    top: 6,
                    right: 6,
                    child: ValueListenableBuilder<Set<String>>(
                      valueListenable: FavouriteController
                          .instance, //untuk pemanggilan favourite button, favouriteController.intance
                      builder: (context, favourites, _) {
                        final isFav = favourites.contains(
                          flower.id,
                        ); //untuk mengecek apakah bunga ini sudah di favoritkan atau belum
                        return InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () => FavouriteController.instance.toggle(
                            flower.id,
                          ), //untuk pemanggilan favourite button, favouriteController.intance.toggle(flower.id)
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.white,
                            child: Icon(
                              isFav ? Icons.favorite : Icons.favorite_border,
                              size: 18,
                              color: isFav ? AppTheme.primary : Colors.grey,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 10, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    flower.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    formatRupiah(flower.price),
                    style: TextStyle(
                      color: AppTheme.primaryDark,
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RatingChip extends StatelessWidget {
  const _RatingChip({required this.rating});

  final double rating; //nilai rating bunga, misal 4.5 dari 5

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star, size: 13, color: Colors.amber),
          SizedBox(width: 3),
          Text(
            rating.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
