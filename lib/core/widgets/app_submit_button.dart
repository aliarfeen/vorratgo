import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vorratgo/core/theming/constants.dart';

class AppSubmitionButton extends StatelessWidget {
  final void Function()? onPressed;
  final String lable;
  final double? width;
  final double? height;
  AppSubmitionButton({
    super.key,
    this.onPressed,
    required this.lable,
    double? width,
    double? height,
  }) : width = width ?? 60.w,
       height = height ?? 40.h;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: AppColors.green,
          padding: EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 32.0.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19.0.r),
          ),
        ),
        onPressed:
            onPressed ??
            () {
              // Default action if no onPressed is provided
              print("Submit button pressed");
            },
        child: Text(
          lable,
          style: TextStyles.white16Bold.copyWith(fontSize: 18.sp),
        ),
      ),
    );
  }
}
