import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vorratgo/core/DI/shared_prefernces/shared_pref_di.dart';
import 'package:vorratgo/core/widgets/main_navigation_screen.dart';
import 'package:vorratgo/features/authentication/cubit/firebase_email_password_auth_cubit.dart';
import 'package:vorratgo/features/authentication/presentation/pages/email_auth.dart';
import 'package:vorratgo/features/onboarding/bloc/cubit/onboarding_cubit.dart';
import 'package:vorratgo/features/landing/presentation/widgets/landing.dart';
import 'package:vorratgo/features/phone_authentication/bloc/cubit/phone_auth_cubit.dart';
import 'package:vorratgo/features/phone_authentication/presentaion/screens/add_phone_number.dart';
import 'package:vorratgo/features/phone_authentication/presentaion/screens/otp_phone_verification.dart';
import 'package:vorratgo/features/home/presentation/screens/home.dart';
import 'package:vorratgo/features/onboarding/presentaion/screens/onboarding.dart';
import 'package:vorratgo/features/products/cubit/product_cubit.dart';
import 'package:vorratgo/features/products/data/model/product_model.dart';
import 'package:vorratgo/features/products/presentaion/screens/product_details.dart';
import 'package:vorratgo/features/products/presentaion/screens/products.dart';
import 'package:vorratgo/features/select_language/prsentation/screens/select_lang.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MainNavigationScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/selectLanguage':
        return MaterialPageRoute(builder: (_) => const SelectLanguageScreen());
      case '/emailPasswordAuth':
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<FirebaseEmailPasswordAuthCubit>(),
                child: AuthUsingEmailPage(),
              ),
        );
      case '/otpVerification':
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => PhoneAuthCubit(),
                child: const OTPScreen(),
              ),
        );
      case '/addPhoneNumber':
        // return MaterialPageRoute(builder: (_) => const AddPhoneNumberScreen());
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => PhoneAuthCubit(),
                child: const AddPhoneNumberScreen(),
              ),
        );
      case '/onboarding':
        // return MaterialPageRoute(builder: (_) => const OnboardingScreen());
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<OnboardingCubit>(),
                child: OnboardingScreen(),
              ),
        );
      case '/landing':
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<OnboardingCubit>(),
                child: const LandingScreen(),
              ),
        );
      case '/products':
        final args = settings.arguments;
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        getIt<ProductCubit>()..filterProducts(args.toString()),
                child: ProductsScreen(category: args.toString()),
              ),
        );
      case '/productDetails':
        final args = settings.arguments;

        if (args is! Product) {
          return MaterialPageRoute(
            builder:
                (_) => Scaffold(
                  body: Center(child: Text('No product details available')),
                ),
          );
        }

        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (_) => getIt<ProductCubit>(),
                child: ProductDetailsScreen(product: args),
              ),
        );
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
