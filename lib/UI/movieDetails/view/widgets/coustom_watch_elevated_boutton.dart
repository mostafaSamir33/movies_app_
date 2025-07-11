import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class CustomWatchElevatedButton extends StatelessWidget {
  const CustomWatchElevatedButton(
      {super.key, required this.title, this.onPressed});
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.0.w),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(16.r),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r)),
            backgroundColor: AppColors.red,
            foregroundColor: AppColors.white,
            minimumSize: Size(double.infinity, 58.h)),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 20.sp, fontWeight: FontWeight.w700, fontFamily: 'Roboto'),
        ),
      ),
    );
  }
}
