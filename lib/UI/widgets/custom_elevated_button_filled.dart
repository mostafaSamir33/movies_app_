import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/utils/app_assets.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/custom_text_styles.dart';

class CustomElevatedButtonFilled extends StatelessWidget {
  final String buttonText;
  final void Function() onPressed;
  final bool isSinginPage;

  const CustomElevatedButtonFilled({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.isSinginPage = false,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.r),
        ),
        backgroundColor: AppColors.yellow,
        minimumSize: Size(double.infinity.w, 56.h),
      ),
      child: isSinginPage
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppAssets.googleIcon),
                SizedBox(
                  width: size.width * .02,
                ),
                Text(
                  buttonText,
                  style: CustomTextStyles.style20w600
                      .copyWith(color: AppColors.black),
                ),
              ],
            )
          : Text(
              buttonText,
              style:
                  CustomTextStyles.style20w600.copyWith(color: AppColors.black),
            ),
    );
  }
}
