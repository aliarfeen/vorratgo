import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:vorratgo/core/theming/constants.dart';

class OtpField extends StatelessWidget {
  const OtpField({super.key});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      cursorColor: AppColors.green,
      length: 6,
      obscureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        inactiveColor: AppColors.lightGrey,
        activeColor: AppColors.green,
        selectedColor: Colors.blue.shade400,
        inactiveFillColor: Colors.white,
        selectedFillColor: AppColors.lightGreen,
        activeFillColor: AppColors.lightGrey,

        shape: PinCodeFieldShape.circle,
        borderRadius: BorderRadius.circular(50),
        fieldHeight: 55,
        fieldWidth: 55,
      ),
      animationDuration: Duration(milliseconds: 200),
      enableActiveFill: true,

      onCompleted: (v) {
        print("Completed");
      },
      onChanged: (value) {
        print(value);
      },
      beforeTextPaste: (text) {
        print("Allowing to paste $text");
        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
        //but you can show anything you want here, like your pop up saying wrong paste format or etc
        return true;
      },
    );
  }
}
