import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vorratgo/core/helpers/extensions.dart';
import 'package:vorratgo/core/helpers/spacers.dart';
import 'package:vorratgo/core/routing/routes.dart';
import 'package:vorratgo/core/theming/constants.dart';
import 'package:vorratgo/features/products/data/model/product_model.dart';

class ProductsGrid extends StatelessWidget {
  final int itemCount;
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
      itemCount: itemCount,
      itemBuilder: (context, index) {
        final product = products[index];
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
            child: Column(
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
                    IconButton(
                      icon: const Icon(Icons.add_box_rounded),
                      color: AppColors.green,

                      iconSize: 45.h,
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
