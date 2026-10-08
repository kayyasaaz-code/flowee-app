import 'package:flutter/material.dart';
import 'package:kopkenApp/models/promo_banner.dart';

class BannerSlide extends StatelessWidget {
  const BannerSlide({super.key, required this.banner});

  final PromoBanner banner;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        width: double.infinity,
        height: 150,
        child: Image.network(
          banner.imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey.shade200,
              alignment: Alignment.center,
              child: const Icon(
                Icons.image_not_supported_outlined,
                color: Colors.grey,
                size: 32,
              ),
            );
          },
          loadingBuilder: (context, child, progress) {
            if (progress == null) {
              return child;
            }

            return Container(
              color: Colors.grey.shade100,
              alignment: Alignment.center,
              child: const CircularProgressIndicator(
                color: Color(0xFF60212D),
                strokeWidth: 2,
              ),
            );
          },
        ),
      ),
    );
  }
}
