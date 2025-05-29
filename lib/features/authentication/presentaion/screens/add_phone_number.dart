import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vorratgo/core/helpers/spacers.dart';
import 'package:vorratgo/core/theming/constants.dart';
import 'package:vorratgo/features/authentication/presentaion/widgets/phone_num_field_row.dart';
import 'package:vorratgo/generated/l10n.dart';

class AddPhoneNumberScreen extends StatelessWidget {
  const AddPhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 120.0.h),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).add_number,
                      style: TextStyles.green24Bold,
                    ),
                    verticalSpacer(8.h),
                    Text(
                      S.of(context).add_number_description,
                      style: TextStyles.green16Bold.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
                verticalSpacer(64.h),
                PhoneNumberFieldRow(),
                verticalSpacer(64.h),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.green,
                      padding: EdgeInsets.symmetric(
                        vertical: 16.0.h,
                        horizontal: 32.0.w,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0.r),
                      ),
                    ),
                    onPressed: () {
                      // Handle button press
                    },
                    child: Text(
                      S.of(context).add_number_button,
                      style: TextStyles.white16Bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
