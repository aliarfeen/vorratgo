import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vorratgo/core/DI/web_services/web_services_di.dart';
import 'package:vorratgo/core/data/repository/local_repository.dart';
import 'package:vorratgo/core/helpers/spacers.dart';
import 'package:vorratgo/core/widgets/app_submit_button.dart';
import 'package:vorratgo/core/widgets/main_navigation_screen.dart';
import 'package:vorratgo/features/authentication/presentation/widgets/auth_image.dart';

class AuthGatePage extends StatelessWidget {
  const AuthGatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final localRepo = sl<LocalRepo>();
    final user = localRepo.getUser();

    if (user != null) {
      return MainNavigationScreen();
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AuthImage(),
            verticalSpacer(30.h),
            AppSubmitionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/emailPasswordAuth');
              },
              lable: 'Login Now',
              width: 200,
              height: 55,
            ),
            verticalSpacer(10.h),
            AppSubmitionButton(
              onPressed: () {
                localRepo.saveGuestMode(true);
                Navigator.pushNamed(context, '/');
              },
              lable: 'Guest Mode',
              width: 200,
              height: 55,
            ),
          ],
        ),
      ),
    );
  }
}
