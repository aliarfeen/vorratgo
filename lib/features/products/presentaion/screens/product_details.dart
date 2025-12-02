import 'package:flutter/material.dart';
import 'package:vorratgo/core/theming/constants.dart';
import 'package:vorratgo/core/helpers/spacers.dart';
import 'package:vorratgo/features/products/data/model/product_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///  Image slider container
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: Hero(
                tag: product.id,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    product.imgUri,
                    height: 220,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),

            ///  Product Name + Favorite Icon
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.name.en,
                    style: TextStyles.black20Bold.copyWith(fontSize: 26),
                  ),
                  Icon(Icons.favorite_border, size: 30),
                ],
              ),
            ),

            verticalSpacer(20),

            /// ⭐ Quantity + Price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Quantity box
                  Container(
                    height: 50,
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.remove, color: Colors.green, size: 28),
                        Text(
                          "1",
                          style: TextStyles.orange24Bold.copyWith(fontSize: 20),
                        ),
                        Icon(Icons.add, color: Colors.green, size: 28),
                      ],
                    ),
                  ),

                  /// Price
                  Text(
                    "\$${product.price}",
                    style: TextStyles.black20Bold.copyWith(fontSize: 28),
                  ),
                ],
              ),
            ),

            verticalSpacer(30),

            /// ⭐ Product Detail (Expandable)
            ExpansionTile(
              title: Text("Product Detail", style: TextStyles.black16Reguler),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  child: Text(
                    product.description.en,
                    style: TextStyle(color: Colors.grey.shade700, height: 1.4),
                  ),
                ),
              ],
            ),

            verticalSpacer(20),

            /// ⭐ Add to Basket Button
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    "Add To Basket",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
