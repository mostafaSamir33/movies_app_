import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class MovieSectionView extends StatelessWidget {
  const MovieSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 641.h,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://yts.mx/assets/images/movies/Titanic_1997/large-cover.jpg"))),
      child: Container(
        width: double.infinity,
        height: 641.h,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [AppColors.black1.withAlpha(200), AppColors.black1],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [.8, 1])),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                height: (248).h,
              ),
              Image.asset(
                AppAssets.playerIcon,
                width: 97.w,
              ),
              Spacer(),
              Text(
                'Doctor Strange in the Multiverse of Madness',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                    fontFamily: 'Roboto'),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                '2020',
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.whiteGrey,
                    fontFamily: 'Roboto'),
              ),
              SizedBox(
                height: 16.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
