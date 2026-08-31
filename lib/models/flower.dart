import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

import 'package:flutter/material.dart';

class Flower {
  final String id;
  final String name;
  final String category;
  final Double price;
  final Double rating;
  final String description;
  final String imageUrl;
  final IconData icon;
  final Color color;

  Flower({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.rating,
    required this.description,
    required this.imageUrl,
    required this.icon,
    required this.color,
  });
}
