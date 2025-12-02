import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vorratgo/core/helpers/extensions.dart';
import 'package:vorratgo/core/routing/routes.dart';
import 'package:vorratgo/core/theming/constants.dart';
import 'package:vorratgo/features/onboarding/bloc/cubit/onboarding_cubit.dart';
import 'package:vorratgo/features/onboarding/presentaion/widgets/image_with_gradient.dart';
import 'package:vorratgo/generated/l10n.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController index = PageController(
    viewportFraction: 1,
    initialPage: 0,
  );

  final List<String> onboardingImages = [
    'assets/images/one.png',
    'assets/images/two.png',
    'assets/images/three.png',
  ];

  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    index.addListener(() {
      final page = index.page?.round() ?? 0;
      if (page != currentPage) {
        setState(() {
          currentPage = page;
        });
      }
    });
  }

  @override
  void dispose() {
    index.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> onboardingCaptions = [
      S.of(context).onboarding_caption_0,
      S.of(context).onboarding_caption_1,
      S.of(context).onboarding_caption_2,
    ];
    return Scaffold(
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.only(bottom: 100.h),
        child: PageView.builder(
          controller: index,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, idx) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Stack(
                children: [
                  ImageWithGradient(
                    onboardingImages: onboardingImages,
                    index: idx,
                  ),
                  Positioned(
                    bottom: 40.h,
                    left: 20.w,
                    right: 20.w,
                    child: Text(
                      onboardingCaptions[idx],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          itemCount: 3,
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        color: Colors.black,
        height: 120.h,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                if (currentPage > 0) {
                  index.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              icon: const Icon(
                Icons.arrow_back_ios_outlined,
                color: AppColors.orange,
                size: 50,
              ),
            ),
            Center(
              child: SmoothPageIndicator(
                controller: index,
                count: 3,
                effect: WormEffect(
                  dotColor: Colors.white,
                  activeDotColor: AppColors.orange,
                  dotHeight: 12.h,
                  dotWidth: 25.w,
                ),
              ),
            ),
            currentPage == 2
                ? TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.orange,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 10.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                  onPressed: () {
                    context.pushReplacementNamed(Routes.authGate);
                    context.read<OnboardingCubit>().completeOnboarding();
                  },
                  child: Text(
                    S.of(context).get_started,
                    style: TextStyles.orange16Reguler.copyWith(
                      color: Colors.white,
                    ),
                  ),
                )
                : IconButton(
                  onPressed: () {
                    if (currentPage < 2) {
                      index.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColors.orange,
                    size: 50,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
