import 'package:flutter/material.dart';

class Category {
  final String id;
  final String name;
  final String iconPath;
  final IconData? iconData;
  final Color? color;

  const Category({
    required this.id,
    required this.name,
    required this.iconPath,
    this.iconData,
    this.color,
  });
}
