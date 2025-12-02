import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vorratgo/core/helpers/extensions.dart';
import 'package:vorratgo/core/routing/routes.dart';
import 'package:vorratgo/core/theming/constants.dart';
import 'package:vorratgo/features/otp_authentication/bloc/cubit/phone_auth_cubit.dart';

class PhoneAuthBlocListener extends StatelessWidget {
  const PhoneAuthBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
      listenWhen:
          (previous, current) =>
              current is Loading ||
              current is PhoneNumberSubmited ||
              current is PhoneOTPVerified ||
              current is ErrorOccurred,
      listener: (context, state) {
        if (state is Loading) {
          showDialog(
            context: context,
            builder:
                (context) => const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.orange,
                    strokeWidth: 2.0,
                  ),
                ),
          );
        } else if (state is PhoneOTPVerified) {
          Navigator.pop(context); // Close the loading dialog
          Navigator.pushNamed(context, Routes.home);
        } else if (state is ErrorOccurred) {
          setupErrorState(context, (state).errorMsg);
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            icon: const Icon(Icons.error, color: Colors.red, size: 32),
            content: Text(error, style: TextStyles.green20Reguler),
            actions: [
              TextButton(
                onPressed: () {
                  context.pop();
                },
                child: Text('Got it', style: TextStyles.orange24Bold),
              ),
            ],
          ),
    );
  }
}
