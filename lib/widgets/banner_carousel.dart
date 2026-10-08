import 'dart:async';
import 'package:flutter/material.dart';
import '../models/promo_banner.dart';
import 'banner_slide.dart';
import 'carousel_dots.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key, required this.banners});

  final List<PromoBanner> banners;

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  late final PageController _controller = PageController();
  Timer? _timer;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    // Otomatis berpindah slide setiap 4 detik
    _timer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!mounted || widget.banners.isEmpty) return;
      final next = (_page + 1) % widget.banners.length;
      _controller.animateToPage(
        next,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.banners.isEmpty) {
      return const SizedBox.shrink();
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Ketinggian disesuaikan agar pas dengan mockup (140 px)
        SizedBox(
          height: 140,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.banners.length,
            onPageChanged: (index) => setState(() => _page = index),
            itemBuilder: (context, index) =>
                BannerSlide(banner: widget.banners[index]),
          ),
        ),
        const SizedBox(height: 8),
        // Indikator Titik (Dots)
        CarouselDots(
          count: widget.banners.length,
          activeIndex: _page,
          activeColor: const Color(
            0xFF60212D,
          ), // Disamakan dengan warna tema utama
        ),
      ],
    );
  }
}
