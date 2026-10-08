import 'package:flutter/material.dart';

class CartSummary extends StatelessWidget {
  const CartSummary({super.key, required this.subtotal});

  final double subtotal;

  static const _primaryColor = Color(0xFF60212D);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          _buildRow('Subtotal', _formatPrice(subtotal)),
          const SizedBox(height: 12),
          Divider(color: Colors.grey.shade200, height: 1),
          const SizedBox(height: 12),
          _buildRow('Total', _formatPrice(subtotal), isTotal: true),
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.w700 : FontWeight.w500,
            color: isTotal ? Colors.black87 : Colors.grey.shade600,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 17 : 14,
            fontWeight: FontWeight.w700,
            color: isTotal ? _primaryColor : Colors.black87,
          ),
        ),
      ],
    );
  }

  String _formatPrice(double value) {
    final price = value.toStringAsFixed(0);

    return 'Rp ${price.replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (match) => '${match.group(1)}.')}';
  }
}
