import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class CoustomeInformationContainer extends StatelessWidget {
  const CoustomeInformationContainer(
      {super.key, required this.icon, required this.data});
  final String icon;
  final String data;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          ImageIcon(
            AssetImage(icon),
            size: 25.sp,
            color: AppColors.amber,
          ),
          SizedBox(
            width: 14.w,
          ),
          Text(
            data,
            style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                fontFamily: 'Roboto',
                color: AppColors.white),
          )
        ],
      ),
    );
  }
}
