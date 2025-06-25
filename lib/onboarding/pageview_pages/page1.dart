import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/common/app_colors.dart';
import 'package:movies_app/common/custom_text_styles.dart';

import '../../common/app_assets.dart';
import '../widgets/custom_elevated_button_filled.dart';

class Page1 extends StatelessWidget {
  final PageController controller;

  const Page1({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            AppAssets.onboardingImage2,
            fit: BoxFit.cover,
            width: double.infinity.w,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff084250),
                  Color(0xff084250).withValues(alpha: 0),
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
                top: 34.r,
                bottom: 20.r,
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
                    'Discover Movies', //TODO:localization
                    style: CustomTextStyles.style24w700.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.r),
                    child: Text(
                      //TODO:localization
                      'Explore a vast collection of movies in all\nqualities and genres. Find your next\nfavorite film with ease.',
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
