import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Widget ini tidak menyimpan teks yang diketik penggunanya sendiri.
/// Setiap kali user mengetik, "onChanged" akan dipanggil dan HomeScreen yang akan menyimpan teksnya lalu
/// memakainya untuk memfilter daftar produk (penerapan "lifting state up").
class SearchField extends StatelessWidget {
  const SearchField({super.key, required this.onChanged});

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      style: const TextStyle(color: Colors.white, fontSize: 14),
      decoration: InputDecoration(
        hintText: "Search coffee...",
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(0.7),
          fontSize: 13.5,
        ),
        prefixIcon: const Icon(Icons.search_rounded, color: Colors.white),
        filled: true,
        fillColor: AppTheme.accentBeige,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
