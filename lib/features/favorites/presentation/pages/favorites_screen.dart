import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vorratgo/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:vorratgo/core/cubits/fav_cubit/favorites_cubit.dart';
import 'package:vorratgo/core/data/model/cart_item.dart';
import 'package:vorratgo/core/theming/constants.dart';
import 'package:vorratgo/features/favorites/presentation/widgets/favorite_item_widget.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  void _loadFavorites() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      context.read<FavoritesCubit>().fetchFavoritesFirebase(user.uid);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorites',
          style: TextStyles.black20Bold.copyWith(fontSize: 24.sp),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const SizedBox(), // Remove back button if it's a main tab, or keep it if it's pushed
      ),
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          if (state is FavoritesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FavoritesError) {
            return Center(child: Text(state.message));
          }

          final cubit = context.read<FavoritesCubit>();
          if (cubit.items.isEmpty) {
            return Center(
              child: Text(
                'No favorites yet',
                style: TextStyles.black16Bold,
              ),
            );
          }

          return ListView.separated(
            padding: EdgeInsets.all(16.w),
            itemCount: cubit.items.length,
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
            itemBuilder: (context, index) {
              final item = cubit.items[index];
              return FavoriteItemWidget(
                item: item,
                onRemove: () {
                  final user = FirebaseAuth.instance.currentUser;
                  if (user != null) {
                    cubit.removeFromFavoritesFirebase(user.uid, item.productId);
                  }
                },
                onAddToCart: () {
                  final user = FirebaseAuth.instance.currentUser;
                  if (user != null) {
                    final cartItem = CartItem(
                      productId: item.productId,
                      quantity: '1',
                      price: item.price,
                      imgUri: item.imgUri,
                      name: item.name,
                    );
                    context.read<CartCubit>().addToCartFirebase(user.uid, cartItem);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Added to cart'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}
