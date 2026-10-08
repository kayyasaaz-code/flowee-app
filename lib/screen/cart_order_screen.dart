import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../models/coffee.dart';
import '../widgets/cart_item_card.dart';
import '../widgets/cart_summary.dart';

class CartOrderScreen extends StatefulWidget {
  const CartOrderScreen({super.key});

  @override
  State<CartOrderScreen> createState() => _CartOrderScreenState();
}

class _CartOrderScreenState extends State<CartOrderScreen> {
  final Map<String, int> _cartQuantities = {'C1': 1, 'C2': 2};

  List<Coffee> get _cartItems {
    return dummyCoffees
        .where((coffee) => _cartQuantities.containsKey(coffee.id))
        .toList();
  }

  double get _subtotal {
    return _cartItems.fold(0, (total, coffee) {
      final quantity = _cartQuantities[coffee.id] ?? 0;
      return total + (coffee.price * quantity);
    });
  }

  void _increaseQuantity(Coffee coffee) {
    setState(() {
      _cartQuantities[coffee.id] = (_cartQuantities[coffee.id] ?? 0) + 1;
    });
  }

  void _decreaseQuantity(Coffee coffee) {
    final currentQuantity = _cartQuantities[coffee.id] ?? 0;

    if (currentQuantity <= 1) {
      return;
    }

    setState(() {
      _cartQuantities[coffee.id] = currentQuantity - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          'Cart & Order',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.grey.shade50,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 110),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pesanan Kamu',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 14),
            ..._cartItems.map((coffee) {
              final quantity = _cartQuantities[coffee.id] ?? 0;

              return CartItemCard(
                coffee: coffee,
                quantity: quantity,
                onDecrease: () => _decreaseQuantity(coffee),
                onIncrease: () => _increaseQuantity(coffee),
              );
            }),
            const SizedBox(height: 10),
            CartSummary(subtotal: _subtotal),
            const SizedBox(height: 20),
            _buildOrderButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF60212D),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: const Text(
          'Lanjutkan Pesanan',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
