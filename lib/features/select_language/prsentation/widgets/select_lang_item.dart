import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vorratgo/core/theming/constants.dart';

class SelectLangItem extends StatelessWidget {
  final String text;
  final String img;
  final VoidCallback onTap;

  const SelectLangItem({
    super.key,
    required this.text,
    required this.img,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: AppColors.orange.withOpacity(0.4),
              blurRadius: 10,
              offset: Offset(0, 0),
            ),
          ],
          border: Border.all(color: AppColors.green, width: 5),
          color: Colors.white,
        ),

        child: Column(
          children: [
            SvgPicture.asset(height: 100, width: 100, img),
            Text(text, style: TextStyles.green24Bold),
          ],
        ),
      ),
    );
  }
}
