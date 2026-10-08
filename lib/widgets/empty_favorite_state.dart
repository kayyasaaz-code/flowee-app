import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class EmptyFavoriteState extends StatelessWidget {
  const EmptyFavoriteState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: AppTheme.primaryDark.withOpacity(0.08),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.favorite_border_rounded,
                size: 44,
                color: AppTheme.primaryDark,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Belum Ada Kopi Favorit',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Tekan ikon hati pada kopi yang kamu sukai untuk menyimpannya di sini.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
