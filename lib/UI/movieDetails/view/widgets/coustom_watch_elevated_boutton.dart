import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class CoustomWatchElevatedBoutton extends StatelessWidget {
  const CoustomWatchElevatedBoutton(
      {super.key, required this.title, this.onPressed});
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(16)),
            backgroundColor: AppColors.red,
            foregroundColor: AppColors.white,
            minimumSize: Size(double.infinity, 58.h)),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, fontFamily: 'Roboto'),
        ),
      ),
    );
  }
}
