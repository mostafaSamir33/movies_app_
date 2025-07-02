import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class ScreenShotsSectionView extends StatelessWidget {
  const ScreenShotsSectionView(
      {super.key,
      required this.screenShot1,
      required this.screenShot2,
      required this.screenShot3});
  final String screenShot1;
  final String screenShot2;
  final String screenShot3;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        spacing: 14.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Screen Shots',
            style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                fontFamily: 'Roboto',
                color: AppColors.white),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              screenShot1,
              height: 176.h,
              fit: BoxFit.cover,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              screenShot2,
              height: 176.h,
              fit: BoxFit.cover,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              screenShot3,
              height: 176.h,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
