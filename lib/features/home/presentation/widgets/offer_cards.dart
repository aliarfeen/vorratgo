import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vorratgo/core/helpers/spacers.dart';
import 'package:vorratgo/core/theming/constants.dart';

class Offer_Cards extends StatelessWidget {
  final List<String> offers = [
    'assets/images/beef_offer.jpg',
    'assets/images/chicken_offer.jpg',
    'assets/images/liver_offer.jpg',
  ];
  Offer_Cards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.yellow.withAlpha(30), // Light background color
        borderRadius: BorderRadius.circular(16.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 2.0.w, vertical: 16.0.h),
      height: 260.h, // Set a fixed height for the ListView
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Row(
              children: [
                Icon(
                  Icons.local_offer,
                  color: AppColors.orange,
                  size: 28.sp, // Adjust icon size as needed
                ),
                Text(
                  'Offers',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.orange,
                  ),
                ),
              ],
            ),
          ),
          verticalSpacer(16.h),
          SizedBox(
            height: 170.h, // Set the height to match the ListView
            width: double.infinity, // Full width
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // Horizontal scrolling
              physics: BouncingScrollPhysics(), // Bouncing effect
              itemCount: 3,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // Handle tap on the card
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Tapped on offer ${index + 1}')),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        offers[index], // Adjust the image path as needed
                        fit: BoxFit.fill,

                        width: 220.w,
                        height: 170.h, // Set the height to match the ListView
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
