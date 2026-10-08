import 'package:flutter/material.dart';
import 'screen/splash_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const KopkenApp());
}

class KopkenApp extends StatelessWidget {
  const KopkenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Kopken App",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const SplashScreen(),
    );
  }
}
