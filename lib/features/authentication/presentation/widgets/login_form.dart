import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vorratgo/core/theming/constants.dart';
import 'package:vorratgo/core/widgets/app_submit_button.dart';
import 'package:vorratgo/core/widgets/app_text_form_field.dart';
import 'package:vorratgo/core/cubits/user_auth_cubit/firebase_email_password_auth_cubit.dart';

class AuthLoginForm extends StatefulWidget {
  AuthLoginForm({super.key});

  @override
  State<AuthLoginForm> createState() => _AuthLoginFormState();
}

class _AuthLoginFormState extends State<AuthLoginForm> {
  bool _isPasswordVisible = false;

  //----------------------------------password validation------------
  String passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    if (value.length < 8) {
      return "Password must be at least 8 characters";
    }
    if (!RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    ).hasMatch(value)) {
      return "Password must contain uppercase, lowercase, number and special character";
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<FirebaseEmailPasswordAuthCubit>().logInFormKey,
      child: Column(
        children: [
          AppTextFieldForm(
            padding: EdgeInsets.only(bottom: 16.h),
            controller:
                context.read<FirebaseEmailPasswordAuthCubit>().emailController,
            keyboardType: TextInputType.emailAddress,
            isEnabled: true,
            onChanged: (value) {},
            lableText: 'E-mail',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "HAHAHA";
              }
              if (value.length < 10) {
                return "HAHAHA";
              }
              return null;
            },
            hintText: 'mohamed@gmail.com',
          ),
          AppTextFieldForm(
            padding: EdgeInsets.zero,
            suffixIcon:
                _isPasswordVisible
                    ? IconButton(
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = false;
                        });
                      },
                      icon: Icon(Icons.visibility_off),
                    )
                    : IconButton(
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = true;
                        });
                      },
                      icon: Icon(Icons.visibility),
                    ),
            controller:
                context
                    .read<FirebaseEmailPasswordAuthCubit>()
                    .passwordController,
            keyboardType: TextInputType.visiblePassword,
            isObsecured: _isPasswordVisible ? false : true,
            isReadOnly: false,
            isEnabled: true,
            onChanged: (value) {},
            lableText: 'Password',
            validator: (value) => passwordValidator(value),
            hintText: '***************',
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text('Forgot Password?'),
              style: TextButton.styleFrom(
                padding: EdgeInsets.only(right: 16.w),
                textStyle: TextStyles.black16Reguler,
              ),
            ),
          ),
          AppSubmitionButton(
            width: 364.w,
            height: 67.h,
            lable: 'Log In',

            onPressed: () {
              final cubit = context.read<FirebaseEmailPasswordAuthCubit>();
              if (cubit.logInFormKey.currentState!.validate()) {
                //TODO: handle
                cubit.login(
                  cubit.emailController.text,
                  cubit.passwordController.text,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
