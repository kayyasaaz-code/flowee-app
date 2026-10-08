import 'package:flutter/material.dart';
import '../widgets/onboarding_content.dart';
import '../widgets/onboarding_hero_image.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF42281D), // Dark Brown Background
      body: Stack(
        children: [
          // 1. Gambar Pouring Coffee & Coffee Beans
          const OnboardingHeroImage(
            imageUrl:
                'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?q=80&w=1000&auto=format&fit=crop',
          ),

          // 2. Konten Teks & Tombol
          OnboardingContent(
            title: 'Choice your\nFavorite Coffee',
            subtitle:
                'The best grain, the finest roast, the most\npowerful flavour.',
            buttonText: 'Get Started',
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const LoginScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
