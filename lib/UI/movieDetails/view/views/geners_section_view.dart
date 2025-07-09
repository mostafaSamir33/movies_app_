import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/UI/main_layer/main_layer_screen.dart';
import 'package:movies_app/UI/main_layer/provider/selected_cat_provider.dart';
import 'package:movies_app/core/extentions/context_extention.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:provider/provider.dart';

class GenersSectionView extends StatelessWidget {
  const GenersSectionView({super.key, required this.geners});

  final List<String>? geners;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.getLocalization().geners,
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
            padding: EdgeInsets.all(0),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 10.h,
              childAspectRatio: 3,
            ),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .popUntil(ModalRoute.withName(MainLayerScreen.routeName));
                context.read<SelectedCatProvider>().selectCat(geners![index]);
                currentIndex.value = 2;
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: Text(
                    geners?[index].trim() ?? '',
                    softWrap: false,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto',
                        color: AppColors.white),
                  ),
                ),
              ),
            ),
            itemCount: geners?.length ?? 0,
          )
        ],
      ),
    );
  }
}
