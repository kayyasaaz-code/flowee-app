import 'package:flowee_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

/**
 * widget ini tidak menyimpan teks yang di ketik penggunanya sendiri,
 * setiap kali user mengetik, "onchanged" akan di panggil dan home scrren yang akan menyimpan teks nya lalu
 * memakainya untuk mefilter daftar produk, ini contoh lain dari bola "lifting state up"
 */

class SearchField extends StatelessWidget {
  const SearchField({super.key, required this.onChanged});

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: "cari mawar, TUlip, Anggrek...",
        hintStyle: TextStyle(color: AppTheme.textSecondary, fontSize: 13.5),
        prefixIcon: Icon(Icons.search_rounded, color: AppTheme.textSecondary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
