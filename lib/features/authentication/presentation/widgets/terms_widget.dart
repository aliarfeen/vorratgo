import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vorratgo/core/theming/constants.dart';

class TermsText extends StatelessWidget {
  const TermsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, bottom: 16.0),
        child: RichText(
          text: TextSpan(
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 14,
              height: 1.5,
            ),
            children: [
              const TextSpan(text: 'By continuing you agree to our '),
              TextSpan(
                text: 'Terms of Service',
                style: const TextStyle(
                  color: AppColors.green, // green shade
                  fontWeight: FontWeight.w500,
                ),
                recognizer:
                    TapGestureRecognizer()
                      ..onTap = () {
                        // Navigate to Terms of Service page
                      },
              ),
              const TextSpan(text: ' and '),
              TextSpan(
                text: 'Privacy Policy.',
                style: const TextStyle(
                  color: AppColors.green,
                  fontWeight: FontWeight.w500,
                ),
                recognizer:
                    TapGestureRecognizer()
                      ..onTap = () {
                        // Navigate to Privacy Policy page
                      },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
