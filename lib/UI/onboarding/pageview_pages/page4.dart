import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/custom_text_styles.dart';
import '../../widgets/custom_elevated_button_filled.dart';
import '../../widgets/custom_outlined_button.dart';

class Page4 extends StatelessWidget {
  final PageController controller;

  const Page4({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            AppAssets.onboardingImage5,
            fit: BoxFit.cover,
            width: double.infinity.w,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff601321),
                  Color(0xff601321).withValues(alpha: 0),
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
                    'Rate, Review, and Learn', 
                    style: CustomTextStyles.style24w700.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.r, bottom: 26.r),
                    child: Text(
                      
                      'Share your thoughts on the movies\nyou\'ve watched. Dive deep into film\ndetails and help others discover great\nmovies with your reviews.',
                      style: CustomTextStyles.style20w400.copyWith(
                        color: AppColors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  CustomElevatedButtonFilled(
                    buttonText: 'Next', 
                    onPressed:
                        () => controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        ),
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
