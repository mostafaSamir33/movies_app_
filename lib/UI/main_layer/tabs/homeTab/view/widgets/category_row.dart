import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class CategoryRow extends StatelessWidget {
  const CategoryRow({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                color: AppColors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto'),
          ),
          Row(
            children: [
              Text(
                "See More",
                style: TextStyle(
                    color: AppColors.amber,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    fontFamily: 'Roboto'),
              ),
              const SizedBox(width: 4),
              const Icon(
                Icons.arrow_forward_ios,
                size: 14,
                color: AppColors.amber,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
