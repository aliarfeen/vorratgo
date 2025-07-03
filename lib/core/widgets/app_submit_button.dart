import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vorratgo/core/theming/constants.dart';

class AppSubmitionButton extends StatelessWidget {
  final void Function()? onPressed;
  final String lable;
  AppSubmitionButton({super.key, this.onPressed, required this.lable});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: AppColors.green,
          padding: EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 32.0.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0.r),
          ),
        ),
        onPressed:
            onPressed ??
            () {
              // Default action if no onPressed is provided
              print("Submit button pressed");
            },
        child: Text(lable, style: TextStyles.white16Bold),
      ),
    );
  }
}
