import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vorratgo/core/helpers/extensions.dart';
import 'package:vorratgo/core/helpers/spacers.dart';
import 'package:vorratgo/core/routing/routes.dart';
import 'package:vorratgo/core/theming/constants.dart';
import 'package:vorratgo/features/products/cubit/product_cubit.dart';
import 'package:vorratgo/features/products/data/model/product_model.dart';

class ProductsGrid extends StatelessWidget {
  final int itemCount; // Replace with the actual item count
  final List<Product> products;
  ProductsGrid({super.key, required this.itemCount, required this.products});

  @override
  Widget build(BuildContext context) {
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
      itemCount: itemCount, // Replace with the actual item count
      itemBuilder: (context, index) {
        final product = products[index];
        return InkWell(
          onTap: () {
            context.pushNamed(Routes.productDetails, arguments: product);
          },
          child: Container(
            height: 300.h,
            width: 150.w,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: product.id,
                  child: Image.network(
                    product.imgUri,
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.broken_image,
                        size: 120,
                        color: Colors.grey,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Hero(
                  tag: '${product.id}_name',
                  child: Text(
                    Localizations.localeOf(context).languageCode == 'ar'
                        ? product.name.ar
                        : product.name.en,
                  ),
                ),
                verticalSpacer(15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${product.price} LE',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.green,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_shopping_cart),
                      color: AppColors.orange,
                      iconSize: 28.h,
                      onPressed: () {},
                      // onPressed: () {
                      //   context.read<ProductCubit>().addToCart(product);
                      // },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
