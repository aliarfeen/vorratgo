import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vorratgo/core/helpers/spacers.dart';
import 'package:vorratgo/core/theming/constants.dart';
import 'package:vorratgo/features/authentication/presentation/widgets/auth_image.dart';
import 'package:vorratgo/features/authentication/presentation/widgets/login_form.dart';
import 'package:vorratgo/features/authentication/presentation/widgets/register_form.dart';

class AuthUsingEmailPage extends StatefulWidget {
  AuthUsingEmailPage({super.key});

  @override
  State<AuthUsingEmailPage> createState() => _AuthUsingEmailPageState();
}

class _AuthUsingEmailPageState extends State<AuthUsingEmailPage> {
  bool _isRegister = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 32.0),
          child: Column(
            children: [
              AuthImage(),
              verticalSpacer(30.h),
              _isRegister
                  ? ListTile(
                    minTileHeight: 60.h,
                    title: Text(
                      'Sign Up',
                      style: TextStyles.black20Bold.copyWith(fontSize: 26.sp),
                    ),

                    subtitle: Text(
                      'Enter your credentials to continue',
                      style: TextStyles.grey16Regular,
                    ),
                  )
                  : ListTile(
                    minTileHeight: 60.h,
                    title: Text(
                      'Login',
                      style: TextStyles.black20Bold.copyWith(fontSize: 26.sp),
                    ),

                    subtitle: Text(
                      'Enter your email and password',
                      style: TextStyles.grey16Regular,
                    ),
                  ),

              verticalSpacer(30.h),
              _isRegister
                  ? AuthRegisterForm(register: _isRegister)
                  : AuthLoginForm(),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _isRegister
                        ? 'Already have an account?'
                        : 'Don’t have an account?',
                  ),
                  TextButton(
                    child: Text(
                      _isRegister ? 'Login' : 'Singup',
                      style: TextStyles.green16Bold,
                    ),
                    onPressed: () {
                      _isRegister = !_isRegister;
                      setState(() {});
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
