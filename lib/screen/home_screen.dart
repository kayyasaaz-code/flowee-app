import 'package:flutter/material.dart';
import 'package:kopkenApp/widgets/banner_carousel.dart';
import '../data/dummy_data.dart';
import '../models/coffee.dart';
import '../screen/detail_screen.dart';
import '../screen/favorite_screen.dart';
import '../widgets/category_chip_list.dart';
import '../widgets/coffe_card.dart'; // Pastikan nama file widget kartu sesuai
import '../widgets/home_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _query = '';
  String _selectedCategory = 'Dreamy Choco Series';

  // Getter filter kopi berdasarkan query pencarian dan kategori
  List<Coffee> get _filteredCoffees {
    return dummyCoffees.where((coffee) {
      final matchesQuery = coffee.name.toLowerCase().contains(
        _query.toLowerCase(),
      );
      final matchesCategory =
          _selectedCategory == 'Semua' || coffee.category == _selectedCategory;
      return matchesQuery && matchesCategory;
    }).toList();
  }

  void _openDetail(Coffee coffee) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => DetailScreen(coffee: coffee)));
  }

  @override
  Widget build(BuildContext context) {
    final coffees = _filteredCoffees;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // 1. Header Cokelat & Banner Carousel
            SliverToBoxAdapter(
              child: HomeHeader(
                onQueryChanged: (value) => setState(() => _query = value),
                bannerWidget: BannerCarousel(banners: dummyBanners),
                // Callback ketika ikon Favorite di header diklik
                onFavoriteTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const FavoriteScreen()),
                  );
                },
                // Callback ketika ikon Profile di header diklik
                onProfileTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Halaman Profile akan segera hadir!'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
              ),
            ),

            // 2. Space Kompensasi untuk Banner yang Menumpuk (Overlapping)
            const SliverToBoxAdapter(child: SizedBox(height: 85)),

            // 3. Category Chip List (List Kategori Kopi Circular)
            SliverToBoxAdapter(
              child: CategoryChipList(
                categories: dummyCategories,
                selectedCategory: _selectedCategory,
                onCategorySelected: (categoryName) {
                  setState(() {
                    _selectedCategory = categoryName;
                  });
                },
                onSeeAllTap: () {
                  setState(() {
                    _selectedCategory = 'Semua';
                  });
                },
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 20)),

            // 4. Area Grid Produk Kopi (Menggunakan CoffeCard)
            if (coffees.isEmpty)
              const SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Text(
                    'Kopi Tidak Ditemukan!',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ),
              )
            else
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final coffee = coffees[index];
                    return CoffeCard(
                      coffee: coffee,
                      onTap: () => _openDetail(coffee),
                      onAddTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${coffee.name} ditambahkan ke keranjang!',
                            ),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                    );
                  }, childCount: coffees.length),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.68,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
