import 'package:flutter/material.dart';

import '../models/coffee.dart';
import '../models/promo_banner.dart';
import '../models/category.dart';

class DummyUser {
  static const String email = 'demo@flowee.com';
  static const String password = 'flowee123';
  static const String name = 'Demo User';
}

final List<Coffee> dummyCoffees = [
  Coffee(
    id: 'C1',
    name: 'Dreamy Choco Orange',
    category: 'Dreamy Choco Series',
    price: 45000,
    rating: 4.8,
    description:
        'Kopi perpaduan cokelat impian dengan kesegaran ekstrak jeruk pilihan.',
    imageUrl:
        'https://images.squarespace-cdn.com/content/v1/5fa1095912d2fc6dfc63ac9c/3a3d9002-c17c-451d-92d3-39a9b31db960/LP+ONE+PIECE-03.png?format=750w',
    icon: Icons.local_cafe,
    color: Colors.brown.shade300,
  ),
  Coffee(
    id: 'C2',
    name: 'Dreamy Salted Caramel Aren Mocha',
    category: 'Dreamy Choco Series',
    price: 45000,
    rating: 4.8,
    description:
        'Sentuhan salted caramel dan gula aren alami berpadu lembut dengan mocha.',
    imageUrl:
        'https://images.squarespace-cdn.com/content/v1/5fa1095912d2fc6dfc63ac9c/3a3d9002-c17c-451d-92d3-39a9b31db960/LP+ONE+PIECE-03.png?format=750w',
    icon: Icons.local_cafe,
    color: Colors.brown.shade300,
  ),
  Coffee(
    id: 'C3',
    name: 'Captain Apple Cream',
    category: 'Petualangan Rasa',
    price: 45000,
    rating: 4.8,
    description:
        'Rasa apel manis dengan krim lembut untuk petualangan rasa yang unik.',
    imageUrl:
        'https://images.squarespace-cdn.com/content/v1/5fa1095912d2fc6dfc63ac9c/3a3d9002-c17c-451d-92d3-39a9b31db960/LP+ONE+PIECE-03.png?format=750w',
    icon: Icons.local_cafe,
    color: Colors.brown.shade300,
  ),
  Coffee(
    id: 'C4',
    name: 'Red Apple Bun',
    category: 'Petualangan Rasa',
    price: 45000,
    rating: 4.8,
    description:
        'Aroma roti apel merah hangat yang cocok menemani secangkir kopi.',
    imageUrl:
        'https://images.squarespace-cdn.com/content/v1/5fa1095912d2fc6dfc63ac9c/3a3d9002-c17c-451d-92d3-39a9b31db960/LP+ONE+PIECE-03.png?format=750w',
    icon: Icons.local_cafe,
    color: Colors.brown.shade300,
  ),
];
final List<PromoBanner> dummyBanners = [
  PromoBanner(
    imageUrl:
        'https://static.vecteezy.com/system/resources/thumbnails/014/897/912/small_2x/coffee-house-horizontal-banner-with-a-glass-mug-of-multi-layered-hot-cappuccino-with-lush-foam-of-whipped-cream-food-illustration-for-shop-cafe-bar-barista-flyer-advertising-promo-menu-vector.jpg',
  ),
  PromoBanner(
    imageUrl:
        'https://png.pngtree.com/png-clipart/20210620/original/pngtree-coffee-shop-coffee-promotion-banner-png-image_6440530.jpg',
  ),
  PromoBanner(
    imageUrl:
        'https://pustaka.bca.co.id/Promo/A2C31A68-BC10-4CBD-AB51-85474A36CC50/Detail/ImageCover/20251205_KopKen-banner.jpg?v=06102026092422',
  ),
];

final List<Category> dummyCategories = [
  const Category(
    id: 'c1',
    name: 'Dreamy Choco Series',
    iconPath: 'https://cdn-icons-png.flaticon.com/512/3081/3081918.png',
  ),
  const Category(
    id: 'c2',
    name: 'Americano',
    iconPath: 'https://cdn-icons-png.flaticon.com/512/3081/3081918.png',
  ),
  const Category(
    id: 'c3',
    name: 'Machiato',
    iconPath: 'https://cdn-icons-png.flaticon.com/512/3081/3081967.png',
  ),
  const Category(
    id: 'c4',
    name: 'Latte',
    iconPath: 'https://cdn-icons-png.flaticon.com/512/541/541732.png',
  ),
];
