import 'dart:async';

import 'package:flowee_app/models/promo_banner.dart';
import 'package:flowee_app/widgets/banner_slide.dart';
import 'package:flowee_app/widgets/carousel_dots.dart';
import 'package:flutter/material.dart';

//carousel banner akan bergeser setiap beberapa detik,untuk handling timer seperti ini, kita butuh statefull widgetuntuk melakukan perubahan widget pada layar
class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key, required this.banners});

  final List<PromoBanner> banners;

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  /**
   * pagecontroller --> mengatur slide mana yang sedang tampil di pageview, dan juga mengatur animasi slide nya
   */
  //jadi banner ini akan melakukan perubahan tapi menunggu dulu sampai waktu yang telah kita setting, misal 5 detik, baru akan melakukan perubahan ke banner selanjutnya
  late final PageController _controller = PageController();
  Timer? _timer;
  int _page = 0;

  //untuk menganalisis step awal sebelum terjadi perubahan
  @override
  void initState() {
    super.initState();
    //Timer.periodic akan menjalankan fungsi di dalam nya, secara berulang ulang
    _timer = Timer.periodic(Duration(seconds: 4), (_) {
      if (!mounted || widget.banners.isEmpty)
        return; //klo widget nya masih kosong dia gabakalan nge return apapun
      final next = (_page + 1) % widget.banners.length;
      //untuk berpindah ke halaman selnjutnya secara otomatis selama milisecond 500 dan ada animasi sedikit
      _controller.animateToPage(
        next,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );
    });
  }

  @override
  /**
   * Timer HARUS di cancle saat widget di hancurkan (saat tidak tampil d layar), kalu lupa di cancel, timer akan terus mencoba berjalan di latar belakang atu backgorun
   * walaupun carusel nya sudah tidal muncul di layar,ini salh satu penyebab meomori leak di Flutter, karena timer akan terus berjalan di latar belakang dan mencoba mengakses widget yang sudah tidak ada di layar
   */
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     if (widget.banners.isEmpty) {return const SizedBox.shrink();} //buat mengembalikan widget kosong, klo gaada banner
      return Column(
        children: [
          SizedBox(
            height: 168,
            child: PageView.builder(
              controller: _controller,
              itemCount: widget.banners.length,
              /**
               * dipanggil juga saat pengguna swipe manual ke banner selanjutnya, bukan cuman saat di geser otomatis oleh timer
               * supaya titik indikator di bawah selalu sinkron dengam banner yang sedang tampil, kita harus mengupdate _page saat pengguna swipe manual
               */
              onPageChanged: (index) => setState(() => _page = index )
              //ingin menampilkan data data yang ada di list banner, dan di urutin secara index
              itemBuilder: (context, index) => BannerSlide(
                banner: widget.banners[index]
                ), 
              ) ,
          ),
          SizedBox(height: 10,),
          CarouselDots(
            count: widget.banners.length,
            activeIndex: _page,
            activeColor: widget.banners[_page].gradientColors.first,
          )
        ],
      );
       
     }
  }

