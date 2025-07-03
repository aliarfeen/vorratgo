import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vorratgo/core/helpers/spacers.dart';
import 'package:vorratgo/core/theming/constants.dart';
import 'package:vorratgo/features/phone_authentication/presentaion/widgets/auth_text_header.dart';
import 'package:vorratgo/features/products/data/model/product_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  ProductDetailsScreen({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("${product.name.en} Details")),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(32.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.yellow, AppColors.lightGreen],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Hero(
                  tag: product.id,
                  child: Image.network(
                    product.imgUri,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.broken_image,
                        size: 80,
                        color: Colors.grey,
                      );
                    },
                  ),
                ),
              ),
              verticalSpacer(30.h),
              Hero(
                tag: '${product.id}_name',
                child: AuthTextHeader(
                  title: product.name.en,
                  description: product.description.en,
                ),
              ),
              verticalSpacer(10.h),
              Divider(color: AppColors.orange, thickness: 5.0),
              Text(
                "Price: ${product.price} LE",
                style: TextStyles.orange24Bold,
              ),
              verticalSpacer(10.h),
              Container(
                width: double.infinity,
                height: 80.h,
                margin: EdgeInsets.all(10.h),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.orange, width: 3.0),
                  borderRadius: BorderRadius.circular(64.0),
                ),

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.remove_circle_outline_sharp),
                      color: AppColors.orange,
                      iconSize: 32.h,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      "Quantity\n1",
                      style: TextStyles.orange24Bold.copyWith(fontSize: 18.sp),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add_circle_outline_sharp),
                      color: AppColors.orange,
                      iconSize: 32.h,
                    ),
                  ],
                ),
              ),
              // TODO: New Feature: on creating cart logic, add a button to add this product to the cart &counter etccc
            ],
          ),
        ),
      ),
    );
  }
}
