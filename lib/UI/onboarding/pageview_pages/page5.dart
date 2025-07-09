import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/UI/auth/view/screens/signInScreen.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/core/utils/app_prefs.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/custom_text_styles.dart';
import '../../widgets/custom_elevated_button_filled.dart';
import '../../widgets/custom_outlined_button.dart';

class Page5 extends StatelessWidget {
  final PageController controller;

  const Page5({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            AppAssets.onboardingImage6,
            fit: BoxFit.cover,
            width: double.infinity.w,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff2A2C30),
                  Color(0xff2A2C30).withValues(alpha: 0),
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
                top: 26.r,
                bottom: 16.r,
                left: 16.r,
                right: 16.r,
              ),
              decoration: BoxDecoration(
                color: AppColors.black1,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.r),
                  topRight: Radius.circular(40.r),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Start Watching Now', 
                    style: CustomTextStyles.style24w700.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 26.h),
                  CustomElevatedButtonFilled(
                    buttonText: 'Finish', 
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).pushReplacementNamed(SignInScreen.routeName);
                      AppPrefs.onboardingSetBool(
                        AppConstants.onboardingKey,
                        true,
                      );
                    },
                  ),
                  SizedBox(height: 16.h),
                  CustomOutlinedButton(
                    buttonText: 'Back', 
                    onPressed:
                        () => controller.previousPage(
                          duration: Duration(milliseconds: 500),
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
