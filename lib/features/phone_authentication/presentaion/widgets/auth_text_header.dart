import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vorratgo/core/helpers/spacers.dart';
import 'package:vorratgo/core/theming/constants.dart';

class AuthTextHeader extends StatelessWidget {
  final String title, description;
  AuthTextHeader({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyles.green24Bold),
        verticalSpacer(8.h),
        Text(
          description,
          style: TextStyles.green16Bold.copyWith(color: AppColors.grey),
        ),
      ],
    );
  }
}
