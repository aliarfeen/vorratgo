import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:vorratgo/core/cubits/cubit/change_lang_cubit.dart';
import 'package:vorratgo/core/routing/app_router.dart';
import 'package:vorratgo/core/routing/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'generated/l10n.dart';

class VorratGo extends StatelessWidget {
  final AppRouter appRouter;
  const VorratGo({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeLangCubit, Locale>(
      builder: (context, locale) {
        return ScreenUtilInit(
          designSize: const Size(413.82696533203125, 896),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (ctx, child) {
            return MaterialApp(
              locale: locale,
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              title: 'Vorrat Go',
              themeMode: ThemeMode.dark,
              theme: ThemeData(primaryColor: Colors.grey),
              debugShowCheckedModeBanner: false,
              initialRoute: Routes.landing,
              onGenerateRoute: appRouter.generateRoute,
            );
          },
        );
      },
    );
  }
}
