import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vorratgo/core/theming/constants.dart';

class AppSubmitionButton extends StatelessWidget {
  final void Function()? onPressed;
  final String lable;
  final double? width;
  final double? height;
  final Color? color;
  final Color? textColor;

  AppSubmitionButton({
    super.key,
    this.onPressed,
    required this.lable,
    Color? color,
    Color? textColor,
    double? width,
    double? height,
  }) : textColor = textColor ?? Colors.white,
       color = color ?? AppColors.green,
       width = width ?? 100.w,
       height = height ?? 50.h;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
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
          style: TextStyles.white16Bold.copyWith(
            fontSize: 18.sp,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
