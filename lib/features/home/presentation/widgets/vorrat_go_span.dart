import 'package:flutter/material.dart';
import 'package:vorratgo/core/theming/constants.dart';

class VorratGoSpan extends StatelessWidget {
  const VorratGoSpan({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyles.green24Bold,
        text: 'Vorrat',
        children: const [
          TextSpan(style: TextStyle(color: AppColors.orange), text: 'Go'),
        ],
      ),
    );
  }
}
