import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/app_colors.dart';
import '../../common/custom_text_styles.dart';

class CustomElevatedButtonFilled extends StatelessWidget {
  final String buttonText;
  final void Function() onPressed;

  const CustomElevatedButtonFilled({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.r),
        ),
        backgroundColor: AppColors.yellow,
        minimumSize: Size(double.infinity.w, 56.h),
      ),
      child: Text(
        buttonText,
        style: CustomTextStyles.style20w600.copyWith(color: AppColors.black),
      ),
    );
  }
}
