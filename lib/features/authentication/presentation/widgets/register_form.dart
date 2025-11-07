import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vorratgo/core/widgets/app_submit_button.dart';
import 'package:vorratgo/core/widgets/app_text_form_field.dart';
import 'package:vorratgo/core/cubits/user_auth_cubit/firebase_email_password_auth_cubit.dart';
import 'package:vorratgo/features/authentication/presentation/widgets/terms_widget.dart';

class AuthRegisterForm extends StatefulWidget {
  AuthRegisterForm({super.key});

  @override
  State<AuthRegisterForm> createState() => _AuthRegisterFormState();
}

class _AuthRegisterFormState extends State<AuthRegisterForm> {
  bool _isPasswordVisible = false;

  //----------------------------------password validation------------
  String? passwordValidator(String? value) {
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
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<FirebaseEmailPasswordAuthCubit>().registerFormKey,
      child: Column(
        children: [
          AppTextFieldForm(
            padding: EdgeInsets.only(bottom: 16.h),
            controller:
                context
                    .read<FirebaseEmailPasswordAuthCubit>()
                    .usernameController,
            keyboardType: TextInputType.emailAddress,
            isEnabled: true,
            onChanged: (value) {},
            lableText: 'User Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Name is required";
              }
              if (value.length < 3) {
                return "Name must be at least 3 characters";
              }
              if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                return "Name can only contain letters and spaces";
              }
              return null;
            },
            hintText: 'Ali Hesham',
          ),
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
            padding: EdgeInsets.only(bottom: 5.h),
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
          TermsText(),
          AppSubmitionButton(
            width: 364.w,
            height: 67.h,
            lable: 'Register',
            onPressed: () {
              final cubit = context.read<FirebaseEmailPasswordAuthCubit>();
              if (cubit.registerFormKey.currentState!.validate()) {
                //TODO: handle
                cubit.register();
              }
            },
          ),
        ],
      ),
    );
  }
}
