import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/app_assets.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AppAssets.emptyList,
        height: 124.h,
        width: 124.w,
      ),
    );
  }
}
