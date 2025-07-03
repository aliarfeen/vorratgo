import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vorratgo/core/helpers/extensions.dart';
import 'package:vorratgo/core/helpers/spacers.dart';
import 'package:vorratgo/core/routing/routes.dart';
import 'package:vorratgo/core/theming/constants.dart';
import 'package:vorratgo/core/widgets/app_submit_button.dart';
import 'package:vorratgo/features/phone_authentication/bloc/cubit/phone_auth_cubit.dart';
import 'package:vorratgo/features/phone_authentication/presentaion/widgets/auth_text_header.dart';
import 'package:vorratgo/features/phone_authentication/presentaion/widgets/phone_auth_bloc_listener.dart';
import 'package:vorratgo/features/phone_authentication/presentaion/widgets/phone_num_field_row.dart';
import 'package:vorratgo/generated/l10n.dart';

class AddPhoneNumberScreen extends StatelessWidget {
  const AddPhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 70.0.h),
          child: Form(
            key: context.read<PhoneAuthCubit>().formKey,

            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuthTextHeader(
                    title: S.of(context).add_number,
                    description: S.of(context).add_number_description,
                  ),
                  verticalSpacer(64.h),
                  PhoneNumberFieldRow(),

                  verticalSpacer(60.h),
                  AppSubmitionButton(
                    lable: S.of(context).add_number_button,
                    onPressed: () {
                      final cubit = context.read<PhoneAuthCubit>();
                      if (cubit.formKey.currentState!.validate()) {
                        // Update the phone number in the cubit's state if necessary
                        // (This assumes updatePhoneNumber is meant to reflect the current input)
                        cubit.updatePhoneNumber(
                          cubit.phoneNumberController.text,
                        );

                        // Now, submit the phone number for verification
                        // The navigation to OTP screen should happen in PhoneAuthBlocListener
                        // once 'PhoneNumberSubmited' state is emitted.
                        cubit.submitPhoneNumber(
                          cubit.phoneNumber,
                        ); // Or cubit.phoneNumberController.text

                        print('Phone Number Submitted: ${cubit.phoneNumber}');
                        // DO NOT context.pushNamed(Routes.otpVerification) here.
                        // Let the BlocListener handle navigation based on the state.
                      }
                    },
                  ),
                  verticalSpacer(28.h),
                  Divider(color: AppColors.green, thickness: 2.0),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.grey,
                        textStyle: TextStyles.orange16Reguler,
                      ),
                      onPressed: () {
                        context.pushReplacementNamed(Routes.initialRoute);
                      },
                      child: Text(S.of(context).login_as_guest),
                    ),
                  ),
                  PhoneAuthBlocListener(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
