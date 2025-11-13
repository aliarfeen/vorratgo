import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vorratgo/core/theming/constants.dart';

class AppTextFieldForm extends StatelessWidget {
  //every changable attribute should be added usually to make it easier for team purpose
  final String hintText;
  final String lableText;
  final TextInputType? keyboardType;
  final bool? isObsecured;
  final bool? isEnabled;
  final bool? isReadOnly;
  final Widget? suffixIcon;
  final Function(String?) validator;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final EdgeInsetsGeometry padding;

  const AppTextFieldForm({
    super.key,
    required this.lableText,
    required this.validator,
    required this.hintText,
    this.keyboardType,
    this.isEnabled,
    this.onChanged,
    this.isReadOnly,
    this.controller,
    this.isObsecured,
    this.suffixIcon,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        controller: controller,
        validator: (value) {
          return validator(value);
        },
        readOnly: isReadOnly ?? false,
        keyboardType: keyboardType,
        cursorColor: AppColors.orange,

        obscureText: isObsecured ?? false,
        style: TextStyles.black16Reguler,
        cursorErrorColor: Colors.red,
        obscuringCharacter: '*',
        onChanged: onChanged,
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          suffixIcon: suffixIcon,
          //suffix: IconButton(onPressed: suffixPressed, icon: Icon(suffixIcon)),
          suffixIconColor: AppColors.green,
          hintText: hintText,
          labelText: lableText,

          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelStyle: TextStyles.green16Reguler.copyWith(color: AppColors.grey),

          hintStyle: TextStyles.green16Reguler.copyWith(color: AppColors.grey),
          contentPadding: EdgeInsets.symmetric(
            vertical: 18.h,
            horizontal: 16.w,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.r)),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.3.w),
            borderRadius: BorderRadius.circular(16.r),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.3.w),
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
      ),
    );
  }
}
