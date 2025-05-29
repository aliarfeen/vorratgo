import 'package:flutter/material.dart';
import 'package:vorratgo/core/theming/constants.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    // List of image URLs or asset paths
    final List<Map<String, String>> categories = [
      {'image': 'assets/images/bakery.jpg', 'name': 'Bekary'},
      {'image': 'assets/images/beverages.jpg', 'name': 'Beverages'},
      {'image': 'assets/images/canned-food.jpg', 'name': 'Canned food'},
      {'image': 'assets/images/cheese.jpg', 'name': 'Cheese'},
      {'image': 'assets/images/grocery.jpg', 'name': 'Grocery'},
      {'image': 'assets/images/pets.jpg', 'name': 'Pets food'},
    ];

    return SizedBox(
      height: 600, // Set a fixed height for the GridView
      child: GridView.builder(
        scrollDirection: Axis.vertical, // Vertical scrolling
        physics: const BouncingScrollPhysics(), // Bouncing effect
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1, // Adjust the aspect ratio as needed
        ),
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      categories[index]['image']!,
                    ), // Use the image
                    fit: BoxFit.cover, // Cover the entire container
                  ),
                  borderRadius: BorderRadius.circular(
                    8.0,
                  ), // Optional: Rounded corners
                ),
              ),
              Positioned(
                bottom: 8.0,
                left: 8.0,
                right: 8.0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4.0,
                    horizontal: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(
                      0.6,
                    ), // Semi-transparent background
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text(
                    categories[index]['name']!, // Display the category name
                    style: TextStyles.white16Reguler,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
