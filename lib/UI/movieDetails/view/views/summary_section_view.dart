import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class SummarySectionView extends StatelessWidget {
  const SummarySectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16.h,
        children: [
          Text(
            'Summary',
            style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                fontFamily: 'Roboto',
                color: AppColors.white),
          ),
          Text(
            'Following the events of Spider-Man No Way Home, Doctor Strange unwittingly casts a forbidden spell that accidentally opens up the multiverse. With help from Wong and Scarlet Witch, Strange confronts various versions of himself as well as teaming up with the young America Chavez while traveling through various realities and working to restore reality as he knows it. Along the way, Strange and his allies realize they must take on a powerful new adversary who seeks to take over the multiverse.—Blazer346',
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto',
                color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
