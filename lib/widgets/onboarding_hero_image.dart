import 'package:flutter/material.dart';

class OnboardingHeroImage extends StatelessWidget {
  const OnboardingHeroImage({
    super.key,
    required this.imageUrl,
    this.heightRatio = 0.58,
  });

  final String imageUrl;
  final double heightRatio;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      height: size.height * heightRatio,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(imageUrl, fit: BoxFit.cover),
          // Gradient Blend Cokelat
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xFF533428).withOpacity(0.3),
                  Colors.transparent,
                  const Color(0xFF42281D),
                ],
                stops: const [0.0, 0.6, 1.0],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
