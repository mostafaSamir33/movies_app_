import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/app_colors.dart';
import '../common/custom_text_styles.dart';

class CustomElevatedButtonFilled extends StatelessWidget {
  final String? buttonText;
  final void Function() onPressed;
  final Widget? buttonTextWidget;
  final Color? buttonColor;

  const CustomElevatedButtonFilled({
    super.key,
    this.buttonText,
    required this.onPressed,
    this.buttonTextWidget,
    this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.r),
        ),
        backgroundColor: buttonColor ?? AppColors.yellow,
        minimumSize: Size(double.infinity.w, 56.h),
      ),
      child:
          buttonTextWidget ??
          Text(
            buttonText ?? '',
            style: CustomTextStyles.style20w600.copyWith(
              color: AppColors.black,
            ),
          ),
    );
  }
}
