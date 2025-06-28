import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/app_assets.dart';
import '../../common/app_colors.dart';
import '../../common/custom_text_styles.dart';
import '../../widgets/custom_elevated_button_filled.dart';
import '../widgets/custom_outlined_button.dart';

class Page3 extends StatelessWidget {
  final PageController controller;

  const Page3({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            AppAssets.onboardingImage4,
            fit: BoxFit.cover,
            width: double.infinity.w,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff4C2471),
                  Color(0xff4C2471).withValues(alpha: 0),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity.w,
              padding: EdgeInsets.only(
                top: 32.r,
                bottom: 32.r,
                left: 16.r,
                right: 16.r,
              ),
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.r),
                  topRight: Radius.circular(40.r),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Create Watch lists', //TODO:localization
                    style: CustomTextStyles.style24w700.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.r, bottom: 16.r),
                    child: Text(
                      //TODO:localization
                      'Save movies to your watchlist to keep\ntrack of what you want to watch next.\nEnjoy films in various qualities and\ngenres.',
                      style: CustomTextStyles.style20w400.copyWith(
                        color: AppColors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  CustomElevatedButtonFilled(
                    buttonText: 'Next', //TODO:localization
                    onPressed:
                        () => controller.nextPage(
                          duration: Duration(seconds: 1),
                          curve: Curves.easeInOut,
                        ),
                  ),
                  SizedBox(height: 16.h),
                  CustomOutlinedButton(
                    buttonText: 'Back',//TODO:localization
                    onPressed:
                        () => controller.previousPage(
                          duration: Duration(seconds: 1),
                          curve: Curves.easeInOut,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
