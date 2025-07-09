import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/extentions/context_extention.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class CastCard extends StatelessWidget {
  const CastCard(
      {super.key,
      required this.imagePath,
      required this.name,
      required this.character});

  final String imagePath;
  final String name;
  final String character;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
          color: AppColors.grey, borderRadius: BorderRadius.circular(16.r)),
      child: Row(
        spacing: 10,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imagePath,
              height: 70.h,
              width: 70.w,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Image.asset(
                AppAssets.failedImage,
                fit: BoxFit.fill,
                height: 70.h,
                width: 70.w,
              ),
            ),
          ),
          Expanded(
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${context.getLocalization().name} $name',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                      fontFamily: 'Roboto'),
                ),
                Text(
                  '${context.getLocalization().character} $character',
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                      fontFamily: 'Roboto'),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
