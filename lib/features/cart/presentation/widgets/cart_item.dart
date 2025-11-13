import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vorratgo/core/theming/constants.dart'; // Ensure this path is correct

class CartItemWidget extends StatelessWidget {
  final String productId;
  final String quantity; // Represents the current item count (e.g., '1')
  final double price;
  final String imgUri;
  final String name;

  // Added callbacks for action
  final VoidCallback onQuantityIncrease;
  final VoidCallback onQuantityDecrease;
  final VoidCallback onRemove;

  const CartItemWidget({
    super.key,
    required this.productId,
    required this.quantity,
    required this.price,
    required this.imgUri,
    required this.name,
    required this.onQuantityIncrease,
    required this.onQuantityDecrease,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final String displayPrice = '${price.toStringAsFixed(2)} LE';

    return Padding(
      padding: EdgeInsets.all(10.0.dm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            imgUri,
            width: 80.w,
            height: 80.w,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return SizedBox(
                width: 80.w,
                height: 80.w,
                child: const Icon(
                  Icons.broken_image,
                  size: 50,
                  color: Colors.grey,
                ),
              );
            },
          ),

          SizedBox(width: 15.w),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  Text(
                    name,
                    style: TextStyles.black16Bold,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),

                  SizedBox(height: 16.h),

                  // Quantity Controls
                  Row(
                    children: [
                      _buildQuantityButton(
                        icon: Icons.remove,
                        onPressed: onQuantityDecrease,
                        isAdd: false,
                      ),

                      // Quantity Text
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Text(
                          quantity,
                          style: TextStyles.black16Bold.copyWith(fontSize: 18),
                        ),
                      ),

                      _buildQuantityButton(
                        icon: Icons.add,
                        onPressed: onQuantityIncrease,
                        isAdd: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SizedBox(width: 15.w),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: onRemove,
                icon: const Icon(Icons.close, color: Colors.grey, size: 20),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),

              SizedBox(height: 20.h),
              Text(
                displayPrice,
                style: TextStyles.black16Bold.copyWith(fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityButton({
    required IconData icon,
    required VoidCallback onPressed,
    required bool isAdd,
  }) {
    return Container(
      width: 38.w,
      height: 38.w,
      decoration: BoxDecoration(),
      child: IconButton(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        icon: Icon(
          icon,
          size: 20.w,
          color: isAdd ? AppColors.green : Colors.grey.shade700,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
