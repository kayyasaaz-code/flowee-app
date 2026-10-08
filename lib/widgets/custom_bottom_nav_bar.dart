import 'package:flutter/material.dart';
import 'bottom_nav_item.dart'; // Impor widget bawaan kamu

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.fromLTRB(20, 0, 20, 16),
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.10),
              blurRadius: 24,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: BottomNavItem(
                icon: Icons.home_rounded,
                label: 'Home',
                selected: selectedIndex == 0,
                onTap: () => onItemSelected(0),
              ),
            ),
            Expanded(
              child: BottomNavItem(
                icon: Icons.confirmation_number_rounded,
                label: 'Rewards',
                selected: selectedIndex == 1,
                onTap: () => onItemSelected(1),
              ),
            ),
            Expanded(
              child: BottomNavItem(
                icon: Icons.shopping_bag_rounded,
                label: 'Cart',
                selected: selectedIndex == 2,
                onTap: () => onItemSelected(2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
