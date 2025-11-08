import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle green24Bold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.green,
  );
  static TextStyle orange24Bold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.orange,
  );
  static TextStyle white24Bold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static TextStyle green20Reguler = TextStyle(
    fontSize: 20.sp,
    color: AppColors.green,
  );
  static TextStyle green16Reguler = TextStyle(
    fontSize: 16.sp,
    color: AppColors.green,
  );
  static TextStyle green16Bold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.green,
  );
  static TextStyle orange16Reguler = TextStyle(
    fontSize: 16.sp,
    color: AppColors.orange,
  );
  static TextStyle white16Reguler = TextStyle(
    fontSize: 16.sp,
    color: Colors.white,
  );
  static TextStyle white16Bold = TextStyle(
    fontSize: 16.sp,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static TextStyle black16Reguler = TextStyle(
    fontSize: 16.sp,
    color: Colors.black,
  );

  static TextStyle black16Bold = TextStyle(
    fontSize: 16.sp,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static TextStyle black20Bold = TextStyle(
    fontSize: 20.sp,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static TextStyle grey16Regular = TextStyle(
    fontSize: 16.sp,
    color: AppColors.grey,
  );
}

class AppColors {
  static const Color green = Color(0xFF53B175);
  static const Color lightGreen = const Color(0xffF6F6F6);
  static const Color grey = Color.fromARGB(255, 58, 58, 58);

  static const Color lightGrey = Color(0xffF6F6F6);
  static const Color orange = Color(0xFFf47015);
  static const Color yellow = Color(0xFFfabc0c);
}

// 1. Primary Color:
// 🟢 Dark Green

//     Use it as the background color for primary buttons (such as "Add to Cart," "Next")
//     Color of the top bar (AppBar)
//     Important icons

// 2. Secondary Color:
// 🟠 Orange

//     Floating Action Button (FAB)
//     Highlighting prices or offers
//     Tags or badges (such as "New," "Discount")

// 3. Background Color:
// ⚪ White

//     Use it as the main background for the application (Scaffold background)
//     Backgrounds for lists and product cards

// 4. Warning/Notification or Attention-Grabbing Color:
// 💛 Yellow

//     Light notifications, hints
//     Backgrounds for "Alert," "Out of Stock" cards
//     Loading or activity indicators
