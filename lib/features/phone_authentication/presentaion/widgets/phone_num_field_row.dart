import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vorratgo/core/theming/constants.dart';
import 'package:vorratgo/core/widgets/app_text_form_field.dart';
import 'package:vorratgo/features/phone_authentication/bloc/cubit/phone_auth_cubit.dart';
import 'package:vorratgo/generated/l10n.dart';

class PhoneNumberFieldRow extends StatelessWidget {
  const PhoneNumberFieldRow({super.key});
  String countryCodeToEmoji(String countryCode) {
    final int firstLetter =
        countryCode.toUpperCase().codeUnitAt(0) - 0x41 + 0x1F1E6;
    final int secondLetter =
        countryCode.toUpperCase().codeUnitAt(1) - 0x41 + 0x1F1E6;
    return String.fromCharCode(firstLetter) + String.fromCharCode(secondLetter);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              height: 40.h,
              child: Text(
                '${countryCodeToEmoji('EG') + ' +20'}',
                style: TextStyles.orange24Bold,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: AppTextFieldForm(
              controller: context.read<PhoneAuthCubit>().phoneNumberController,
              isEnabled: true,
              onChanged: (value) {
                context.read<PhoneAuthCubit>().updatePhoneNumber(value);
                print(
                  'Phone Number: ${context.read<PhoneAuthCubit>().phoneNumber}',
                );
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "HAHAHA";
                }
                if (value.length < 10) {
                  // Assuming the phone number should be at least 10 digits long
                  // Adjust this condition based on your requirements
                  return "HAHAHA";
                }
                return null;
              },
              hintText: '1002368900',
              lableText: S.of(context).add_number_hint,
              keyboardType: TextInputType.phone,
            ),
          ),
        ],
      ),
    );
  }
}
