import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vorratgo/core/helpers/extensions.dart';
import 'package:vorratgo/core/routing/routes.dart';
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
    final cubit = context.read<FirebaseEmailPasswordAuthCubit>();
    return Form(
      key: cubit.loginFormKey,
      child: Column(
        children: [
          AppTextFieldForm(
            padding: EdgeInsets.only(bottom: 16.h),
            controller: cubit.emailController,
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
            controller: cubit.passwordController,
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
          BlocListener<
            FirebaseEmailPasswordAuthCubit,
            FirebaseEmailPasswordAuthState
          >(
            listener: (context, state) {
              //LogiForm
              //login_form
              // TODO: implement listener
              if (state is FirebaseEmailPasswordLogInSuccess) {
                context.pushReplacementNamed(Routes.initialRoute);
              } else if (state is FirebaseEmailPasswordLogInFailure) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            child: AppSubmitionButton(
              width: 364.w,
              height: 67.h,
              lable: 'Log In',

              onPressed: () {
                if (cubit.loginFormKey.currentState!.validate()) {
                  //? performing login using cubit according to current state
                  cubit.login();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
