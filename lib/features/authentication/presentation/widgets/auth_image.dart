import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthImage extends StatelessWidget {
  const AuthImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Blurred background image
        Container(
          width: 200.w,
          height: 200.h,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: Stack(
            children: [
              Image.asset(
                'assets/icons/vorratlogo.png',
                fit: BoxFit.cover,
                width: 200.w,
                height: 200.h,
              ),

              // Blur layer
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
                child: Container(
                  color: Colors.white.withAlpha(60), // adds white fade
                ),
              ),
            ],
          ),
        ),

        // Foreground (sharp) logo
        Image.asset('assets/icons/vorratlogo.png', width: 150.w, height: 150.h),
      ],
    );
  }
}
