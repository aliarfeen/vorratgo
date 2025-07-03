import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vorratgo/core/helpers/spacers.dart';
import 'package:vorratgo/core/theming/constants.dart';
import 'package:vorratgo/features/profile_center/presentation/widgets/setting_list_item.dart';

class ProfileCenterScreen extends StatelessWidget {
  const ProfileCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.0.h, horizontal: 8.0.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 50.r,
                backgroundColor: AppColors.orange.withAlpha(30),
                child: Icon(
                  Icons.face_6_sharp,
                  size: 60.sp,
                  color: AppColors.orange,
                ),
              ),
              verticalSpacer(16.h),
              Text(
                Localizations.localeOf(context).languageCode == 'ar'
                    ? 'زائر'
                    : 'Guest',
                style: TextStyles.orange24Bold,
              ),
              verticalSpacer(32.h),
              SettingListItem(),
              SettingListItem(),
              SettingListItem(),
              SettingListItem(),
            ],
          ),
        ),
      ),
    );
  }
}
