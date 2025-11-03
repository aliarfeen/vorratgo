import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vorratgo/core/theming/constants.dart';
import 'package:vorratgo/features/authentication/cubit/firebase_email_password_auth_cubit.dart';
import 'package:vorratgo/features/authentication/presentation/widgets/login_form.dart';

class AuthUsingEmailPage extends StatelessWidget {
  const AuthUsingEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Auth Using Email')),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Image.asset(
                    'assets/icons/vorratlogo.png',

                    width: 200,
                    height: 200,
                  ),
                  AuthLoginForm(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Don’t have an account?'),
                      TextButton(
                        child: Text('Singup', style: TextStyles.green16Bold),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
