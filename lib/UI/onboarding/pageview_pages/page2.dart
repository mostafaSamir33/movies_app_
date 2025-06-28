import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/UI/widgets/custom_outlined_button.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/custom_text_styles.dart';
import '../../widgets/custom_elevated_button_filled.dart';
import '../../common/app_assets.dart';
import '../../common/app_colors.dart';
import '../../common/custom_text_styles.dart';
import '../../widgets/custom_elevated_button_filled.dart';

class Page2 extends StatelessWidget {
  final PageController controller;

  const Page2({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            AppAssets.onboardingImage3,
            fit: BoxFit.cover,
            width: double.infinity.w,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff85210E),
                  Color(0xff85210E).withValues(alpha: 0),
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
                top: 28.r,
                bottom: 16.r,
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
                    'Explore All Genres', //TODO:localization
                    style: CustomTextStyles.style24w700.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.r, bottom: 16.r),
                    child: Text(
                      //TODO:localization
                      'Discover movies from every genre, in all\navailable qualities. Find something new\nand exciting to watch every day.',
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
