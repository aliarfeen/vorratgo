import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vorratgo/core/helpers/spacers.dart';
import 'package:vorratgo/core/widgets/app_submit_button.dart';
import 'package:vorratgo/features/phone_authentication/bloc/cubit/phone_auth_cubit.dart';
import 'package:vorratgo/features/phone_authentication/presentaion/widgets/auth_text_header.dart';
import 'package:vorratgo/features/phone_authentication/presentaion/widgets/otp_field.dart';
import 'package:vorratgo/generated/l10n.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 120.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<PhoneAuthCubit, PhoneAuthState>(
                builder: (context, state) {
                  String? phoneNumber =
                      (state is PhoneNumberUpdated) ? state.phoneNumber : '';

                  return AuthTextHeader(
                    title: S.of(context).verify_your_number,
                    description:
                        "${S.of(context).verify_your_number_description}+2 \n$phoneNumber",
                  );
                },
              ),
              verticalSpacer(40.h),
              OtpField(),

              verticalSpacer(40.h),
              AppSubmitionButton(
                lable: S.of(context).verification_button_label,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
