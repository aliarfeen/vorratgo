import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vorratgo/core/theming/constants.dart';
import 'package:vorratgo/features/select_language/prsentation/widgets/select_lang_row.dart';

class SelectLanguageScreen extends StatelessWidget {
  const SelectLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 64.h, horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('assets/icons/vorratlogo.png'),
              Text(
                'اختر اللغة\nSelect Language',
                textAlign: TextAlign.center,
                style: TextStyles.green24Bold,
              ),
              SelectLangRow(),
            ],
          ),
        ),
      ),
    );
  }
}
