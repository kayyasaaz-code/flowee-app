import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../screen/detail_screen.dart';
import '../state/favourite_controller.dart';
import '../theme/app_theme.dart';
import '../widgets/coffe_card.dart';
import '../widgets/empty_favorite_state.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Bar dengan Back Button
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 20, 8),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (Navigator.of(context).canPop()) {
                        Navigator.of(context).pop();
                      }
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppTheme.textPrimary,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text('Favorite', style: AppTheme.display(fontSize: 24)),
                ],
              ),
            ),

            // Content Area (Grid / Empty State)
            Expanded(
              child: ValueListenableBuilder<Set<String>>(
                valueListenable: FavouriteController.instance,
                builder: (context, favoriteIds, _) {
                  final favoriteCoffees = dummyCoffees
                      .where((coffee) => favoriteIds.contains(coffee.id))
                      .toList();

                  if (favoriteCoffees.isEmpty) {
                    return const EmptyFavoriteState();
                  }

                  return GridView.builder(
                    padding: const EdgeInsets.fromLTRB(20, 4, 20, 100),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 0.68,
                        ),
                    itemCount: favoriteCoffees.length,
                    itemBuilder: (context, index) {
                      final coffee = favoriteCoffees[index];
                      return CoffeCard(
                        coffee: coffee,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => DetailScreen(coffee: coffee),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
