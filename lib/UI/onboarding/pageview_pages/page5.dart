import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/common/app_constants.dart';
import 'package:movies_app/common/app_prefs.dart';
import 'package:movies_app/UI/auth/screens/signInScreen.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/core/utils/app_prefs.dart';
import 'package:movies_app/UI/screens/update_profile_screen.dart';

import '../../common/app_assets.dart';
import '../../common/app_colors.dart';
import '../../common/custom_text_styles.dart';
import '../../screens/update_profile_screen.dart';
import '../../widgets/custom_elevated_button_filled.dart';
import '../widgets/custom_outlined_button.dart';
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
                color: AppColors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.r),
                  topRight: Radius.circular(40.r),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Start Watching Now', //TODO:localization
                    style: CustomTextStyles.style24w700.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 26.h),
                  CustomElevatedButtonFilled(
                    buttonText: 'Finish', //TODO:localization
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).pushReplacementNamed(Signinscreen.routeName);
                      AppPrefs.onboardingSetBool(
                        AppConstants.onboardingKey,
                        true,
                      );
                    },
                  ),
                  SizedBox(height: 16.h),
                  CustomOutlinedButton(
                    buttonText: 'Back', //TODO:localization
                    onPressed: () => controller.previousPage(
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
