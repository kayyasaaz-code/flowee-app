import 'package:flutter/material.dart';

class FavouriteController extends ValueNotifier<Set<String>> {
  FavouriteController._() : super(<String>{});

  static final FavouriteController instance = FavouriteController._();

  bool isFavourite(String id) => value.contains(id);

  void toggle(String id) {
    final updated = Set<String>.from(value);
    if (!updated.remove(id)) {
      updated.add(id);
    }
    //ELSE
    value = updated;
  }
}
