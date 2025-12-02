import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vorratgo/core/DI/web_services/web_services_di.dart';
import 'package:vorratgo/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:vorratgo/core/cubits/fav_cubit/favorites_cubit.dart';
import 'package:vorratgo/core/cubits/user_auth_cubit/firebase_email_password_auth_cubit.dart';
import 'package:vorratgo/core/data/model/cart_item.dart';
import 'package:vorratgo/core/data/model/favorite_item.dart';
import 'package:vorratgo/core/helpers/extensions.dart';
import 'package:vorratgo/core/helpers/spacers.dart';
import 'package:vorratgo/core/routing/routes.dart';
import 'package:vorratgo/core/theming/constants.dart';
import 'package:vorratgo/features/products/data/model/product_model.dart';
import 'package:vorratgo/features/profile_center/cubit/user_center_cubit.dart';

class ProductsGrid extends StatelessWidget {
  final int itemCount;
  final List<Product> products;
  ProductsGrid({super.key, required this.itemCount, required this.products});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, favState) {
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: itemCount,
              itemBuilder: (context, index) {
                final CartCubit cubit = context.read<CartCubit>();
                final FavoritesCubit favCubit = context.read<FavoritesCubit>();

                final product = products[index];
                final isFavorite = favCubit.isFavorite(product.id);

                return InkWell(
                  onTap: () {
                    context.pushNamed(Routes.productDetails, arguments: product);
                  },
                  child: Container(
                    height: 260.h,
                    width: 173.3249969482422.w,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(color: AppColors.grey),
                    ),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Hero(
                              tag: product.id,
                              child: Image.network(
                                product.imgUri,
                                width: 121.68871307373047,
                                height: 121.68871307373047,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.broken_image,
                                    size: 121.68871307373047,
                                    color: Colors.grey,
                                  );
                                },
                              ),
                            ),
                            Hero(
                              tag: '${product.id}_name',
                              child: Text(
                                Localizations.localeOf(context).languageCode == 'ar'
                                    ? product.name.ar
                                    : product.name.en,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            verticalSpacer(10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${product.price} LE',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                //providing user profile data to add to cart
                                BlocProvider(
                                  create:
                                      (context) =>
                                          sl<UserProfileCenterCubit>()
                                            ..loadUserProfile(),

                                  child: BlocBuilder<
                                    UserProfileCenterCubit,
                                    UserProfileCenterState
                                  >(
                                    builder: (context, state) {
                                      if (state is UserProfileLoaded) {
                                        final user = state.user;
                                        final userId = user.uid;
                                        return IconButton(
                                          icon: const Icon(Icons.add_box_rounded),
                                          color: AppColors.green,

                                          iconSize: 45.h,
                                          onPressed: () {
                                            final cartItem = CartItem(
                                              productId: product.id,
                                              quantity: '1',
                                              price: product.price.toDouble(),
                                              imgUri: product.imgUri,
                                              name: product.name.en,
                                            );
                                            cubit.addToCart(cartItem);
                                            cubit.addToCartFirebase(userId, cartItem);
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  '${Localizations.localeOf(context).languageCode == 'ar' ? product.name.ar : product.name.en} added to cart',
                                                ),
                                                duration: const Duration(seconds: 2),
                                              ),
                                            );
                                          },
                                        );
                                      }
                                      return const CircularProgressIndicator();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                            icon: Icon(
                              isFavorite ? Icons.favorite : Icons.favorite_border,
                              color: isFavorite ? Colors.red : Colors.grey,
                            ),
                            onPressed: () {
                              final userId = FirebaseAuth.instance.currentUser?.uid;
                              if (userId != null) {
                                final favoriteItem = FavoriteItem(
                                  productId: product.id,
                                  name: product.name.en,
                                  price: product.price.toDouble(),
                                  imgUri: product.imgUri,
                                );
                                favCubit.toggleFavoriteFirebase(userId, favoriteItem);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please login to add to favorites'),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
