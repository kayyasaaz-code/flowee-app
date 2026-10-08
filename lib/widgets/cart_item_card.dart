import 'package:flutter/material.dart';
import '../models/coffee.dart';
import 'quantity_selector.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.coffee,
    required this.quantity,
    required this.onDecrease,
    required this.onIncrease,
  });

  final Coffee coffee;
  final int quantity;
  final VoidCallback onDecrease;
  final VoidCallback onIncrease;

  static const _primaryColor = Color(0xFF60212D);

  @override
  Widget build(BuildContext context) {
    final subtotal = coffee.price * quantity;

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          _buildImage(),
          const SizedBox(width: 14),
          Expanded(child: _buildDetails(subtotal)),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Image.network(
        coffee.imageUrl,
        width: 76,
        height: 76,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) {
          return Container(
            width: 76,
            height: 76,
            color: Colors.grey.shade100,
            child: const Icon(Icons.local_cafe_rounded, color: _primaryColor),
          );
        },
      ),
    );
  }

  Widget _buildDetails(double subtotal) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          coffee.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          _formatPrice(coffee.price),
          style: const TextStyle(
            fontSize: 13,
            color: _primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            QuantitySelector(
              quantity: quantity,
              onDecrease: onDecrease,
              onIncrease: onIncrease,
            ),
            Text(
              _formatPrice(subtotal),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _formatPrice(double value) {
    final price = value.toStringAsFixed(0);

    return 'Rp ${price.replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (match) => '${match.group(1)}.')}';
  }
}
