import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class GenersSectionView extends StatelessWidget {
  const GenersSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Geners',
            style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                fontFamily: 'Roboto',
                color: AppColors.white),
          ),
          SizedBox(
            height: 16.h,
          ),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 10.h,
                childAspectRatio: 3),
            itemBuilder: (context, index) => Container(
              height: 40.h,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  'Action',
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto',
                      color: AppColors.white),
                ),
              ),
            ),
            itemCount: 4,
          )
        ],
      ),
    );
  }
}
