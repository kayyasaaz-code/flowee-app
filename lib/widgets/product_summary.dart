// import 'package:flowee_app/main.dart';
import 'package:flutter/material.dart';
import 'package:kopkenApp/models/coffee.dart';
import '../theme/app_theme.dart';

class ProductSummary extends StatelessWidget {
  const ProductSummary({super.key, required this.flower});
  final Coffee flower;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CategoryBadge(text: flower.category),
              SizedBox(height: 10),
              Text(flower.name, style: AppTheme.display(fontSize: 24)),
            ],
          ),
        ),

        _RatingBadge(rating: flower.rating),
      ],
    );
  }
}

class _CategoryBadge extends StatelessWidget {
  const _CategoryBadge({required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        // Menggunakan primarySoft (#81404A)
        color: AppTheme.primarySoft.withOpacity(
          0.12,
        ), // atau withValues(alpha: 0.12)
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: AppTheme.primarySoft,
          fontSize: 11,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _RatingBadge extends StatelessWidget {
  const _RatingBadge({required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.amber.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(14),
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star_rounded, color: Colors.amber, size: 18),
          SizedBox(width: 3),
          Text(
            rating.toString(),
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: AppTheme.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
