import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vorratgo/core/cubits/fav_cubit/favorites_cubit.dart';
import 'package:vorratgo/core/data/model/favorite_item.dart';

/// Example widget showing how to add a favorite button to a product card
class FavoriteButton extends StatelessWidget {
  final String productId;
  final String productName;
  final double productPrice;
  final String productImage;

  const FavoriteButton({
    super.key,
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.productImage,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        final cubit = context.read<FavoritesCubit>();
        final isFavorite = cubit.isFavorite(productId);

        return IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : Colors.grey,
          ),
          onPressed: () {
            final userId = FirebaseAuth.instance.currentUser?.uid;
            if (userId != null) {
              final favoriteItem = FavoriteItem(
                productId: productId,
                name: productName,
                price: productPrice,
                imgUri: productImage,
              );

              cubit.toggleFavoriteFirebase(userId, favoriteItem);

              // Show feedback
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    isFavorite
                        ? 'Removed from favorites'
                        : 'Added to favorites',
                  ),
                  duration: const Duration(seconds: 1),
                ),
              );
            } else {
              // User not logged in
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please log in to add favorites'),
                  duration: Duration(seconds: 2),
                ),
              );
            }
          },
        );
      },
    );
  }
}
