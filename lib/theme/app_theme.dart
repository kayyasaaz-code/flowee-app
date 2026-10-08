import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Merah Maroon Utama (#60212D) -> Untuk Tombol CTA (+), Kategori Aktif
  static const Color primary = Color(0xFF5B3827);

  // Merah Soft / Secondary (#81404A) -> Untuk Badge Promo, Hover, Tag
  static const Color primarySoft = Color(0xFF81404A);

  // Cokelat Tua (#5B3827) -> Untuk Header, Title, Text Utama
  static const Color primaryDark = Color(0xFF60212D);

  // Warm Beige (#D9A484) -> Untuk Card Container, Search Bar, Accent
  static const Color accentBeige = Color(0xFFD9A484);

  // Background & Surface Clean (Putih)
  static const Color background = Color(0xFFFFFFFF); // Putih bersih
  static const Color surface = Color(0xFFFFFFFF); // Putih bersih
  static const Color cardSurface = Color(
    0xFFF9F6F0,
  ); // Opsional: Krem super lembut buat card

  // Text Colors
  static const Color textPrimary = Color(
    0xFF5B3827,
  ); // Cokelat pekat (pengganti hitam pekat)
  static const Color textSecondary = Color(
    0xFF9E9E9E,
  ); // Abu-abu soft untuk deskripsi

  /// Elegant serif used for the brand wordmark and product/section headings.
  static TextStyle display({
    double fontSize = 22,
    FontWeight fontWeight = FontWeight.w700,
    Color color = textPrimary,
    double? letterSpacing,
  }) {
    return GoogleFonts.playfairDisplay(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
    );
  }

  static ThemeData get theme {
    final baseTextTheme = GoogleFonts.plusJakartaSansTextTheme();
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        primary: primary,
        surface: surface,
      ),
      scaffoldBackgroundColor: background,
      textTheme: baseTextTheme.apply(
        bodyColor: textPrimary,
        displayColor: textPrimary,
      ),
    );

    return base.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: background,
        foregroundColor: textPrimary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: display(fontSize: 20),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(54),
          textStyle: baseTextTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFFF7F2F0),
        labelStyle: const TextStyle(color: textSecondary, fontSize: 13.5),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 16,
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
          borderSide: const BorderSide(color: primary, width: 1.6),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: primary,
        unselectedItemColor: Colors.grey.shade400,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

//function untuk handle konversi digit angka untuk harga, yang sebelum nya berformat double menjadi string
String formatRupiah(double price) {
  final str = price.toInt().toString();
  final buffer = StringBuffer();
  final length = str.length;

  for (int i = 0; i < length; i++) {
    if (i > 0 && (length - i) % 3 == 0) {
      buffer.write('.');
    }
    buffer.write(str[i]);
  }

  return "Rp ${buffer.toString()}";
}
