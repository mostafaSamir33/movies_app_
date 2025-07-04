import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/UI/movieDetails/model/movie_details_model.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class MovieSectionView extends StatelessWidget {
  const MovieSectionView({super.key, required this.movie});

  final MovieDetails movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 641.h,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(movie.largeCoverImage ?? ''))),
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
                movie.title ?? '',
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
              movie.year == null
                  ? SizedBox()
                  : Text(
                      (movie.year).toString(),
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
