import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icons.dart';
import 'package:vorratgo/core/helpers/spacers.dart';
import 'package:vorratgo/core/theming/constants.dart';

class SettingListItem extends StatelessWidget {
  const SettingListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(LineIcons.language, size: 30.sp, color: AppColors.green),
              horizontalSpacer(8.w),
              Text('Setting Name', style: TextStyles.black20Bold),
            ],
          ),

          Row(
            children: [
              Text('Value', style: TextStyles.green16Bold),
              horizontalSpacer(8.w),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.orange,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
