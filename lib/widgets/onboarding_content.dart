import 'package:flutter/material.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onPressed,
  });

  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 32,
      right: 32,
      bottom: 48,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Judul Utama
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 16),

          // Subtitle / Deskripsi
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: Colors.white.withOpacity(0.7),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 36),

          // Tombol Get Started
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(
                  0xFFE89538,
                ), // Warna Oranye Karamel
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    26,
                  ), // Capsule style border
                ),
                elevation: 0,
              ),
              child: Text(
                buttonText,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF331D14), // Teks Cokelat Tua
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
