import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/UI/widgets/custom_elevated_button_filled.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/custom_text_styles.dart';

import 'onboarding_screen_2.dart';

class OnboardingScreen1 extends StatelessWidget {
  static const String routeName = '/onboardingScreen1';

  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            AppAssets.onboardingImage1,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.black1,
                  AppColors.black1.withValues(alpha: 0.9),
                  AppColors.black1.withValues(alpha: 0.5),
                  AppColors.black1.withValues(alpha: 0),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 32.r, left: 16.r, right: 16.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  
                  'Find Your Next\nFavorite Movie Here',
                  style: CustomTextStyles.style36w500.copyWith(
                    color: AppColors.white,
                    height: 1.3.h,
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.r, bottom: 24.r),
                  child: Text(
                    
                    'Get access to a huge library of movies\nto suit all tastes. You will surely like it.',
                    style: CustomTextStyles.style20w400.copyWith(
                      color: AppColors.white.withValues(alpha: 0.6.r),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                CustomElevatedButtonFilled(
                  buttonText: 'Explore Now', 
                  onPressed: () => Navigator.of(
                    context,
                  ).pushReplacementNamed(OnboardingScreen2.routeName),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
