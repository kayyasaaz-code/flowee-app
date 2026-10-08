import 'package:flutter/material.dart';

import '../state/auth_controller.dart';
import 'login_screen.dart';
import 'main_screen.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1400),
  )..forward();

  late final Animation<double> _iconScale = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0.0, 0.55, curve: Curves.easeOutBack),
  );

  late final Animation<double> _iconFade = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
  );

  late final Animation<double> _textFade = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0.35, 0.75, curve: Curves.easeOut),
  );

  late final Animation<Offset> _textSlide =
      Tween<Offset>(begin: const Offset(0, 0.15), end: Offset.zero).animate(
        CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.35, 0.75, curve: Curves.easeOutCubic),
        ),
      );

  late final Animation<double> _lineWidth = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0.55, 1.0, curve: Curves.easeOutCubic),
  );

  @override
  void initState() {
    super.initState();
    _bootstrap();
  }

  Future<void> _bootstrap() async {
    await Future.wait([
      AuthController.instance.loadPersistedSession(),
      Future.delayed(const Duration(milliseconds: 1600)),
    ]);
    if (!mounted) return;

    final isLoggedIn = AuthController.instance.value;

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => isLoggedIn
            ? const MainScreen()
            : const OnboardingScreen(), // Lanjut ke Onboarding
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0C0C0C), // Dark Background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _iconFade,
              child: ScaleTransition(
                scale: _iconScale,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFC67C4E).withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.coffee_rounded,
                    size: 64,
                    color: Color(0xFFC67C4E), // Color Aksen Kopi
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            SlideTransition(
              position: _textSlide,
              child: FadeTransition(
                opacity: _textFade,
                child: const Text(
                  'Kopken',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 14),
            AnimatedBuilder(
              animation: _lineWidth,
              builder: (context, child) {
                return SizedBox(
                  width: 48 * _lineWidth.value,
                  child: const Divider(
                    color: Color(0xFFC67C4E),
                    thickness: 2,
                    height: 1,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
