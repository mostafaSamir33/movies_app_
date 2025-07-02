import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/UI/movieDetails/view/widgets/cast_card.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class CastSectionView extends StatelessWidget {
  const CastSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cast',
            style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                fontFamily: 'Roboto',
                color: AppColors.white),
          ),
          SizedBox(
            height: 16.h,
          ),
          ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              height: 8.h,
            ),
            itemCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => CastCard(
                imagePath:
                    "https://yts.mx/assets/images/actors/thumb/nm0939130.jpg",
                name: 'Hayley Atwell',
                character: 'Captain Carter'),
          )
        ],
      ),
    );
  }
}
