import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/common/app_colors.dart';

import '../../common/custom_text_styles.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String buttonText;
  final void Function() onPressed;

  const CustomOutlinedButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,

      borderRadius: BorderRadius.circular(14.r),
      child: InkWell(
        onTap: () => onPressed(),
        splashColor: Colors.white,
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Container(
          height: 54.h,
          width: double.infinity.w,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.yellow, width: 2),
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: Center(
            child: Text(
              buttonText,
              style: CustomTextStyles.style20w600.copyWith(
                color: AppColors.yellow,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
