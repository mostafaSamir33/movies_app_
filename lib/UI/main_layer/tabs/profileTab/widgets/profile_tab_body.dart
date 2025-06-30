import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_assets.dart';

class ProfileTabBody extends StatelessWidget {
  final TabController controller;

  const ProfileTabBody({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: controller,
      children: [
        Center(
          child: Image.asset(
            AppAssets.emptyList,
            height: 124.h,
            width: 124.w,
          ),
        ),
        Center(
          child: Image.asset(
            AppAssets.emptyList,
            height: 124.h,
            width: 124.w,
          ),
        ),
      ],
    );
  }
}
