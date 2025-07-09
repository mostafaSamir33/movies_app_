import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/model/movies_list_response.dart';
import 'package:movies_app/UI/widgets/movie_card.dart';
import 'package:movies_app/core/extentions/context_extention.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class SimilarSectionView extends StatelessWidget {
  const SimilarSectionView({super.key, required this.suggestionMovies});

  final List<Movies> suggestionMovies;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.getLocalization().similar,
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
              crossAxisCount: 2,
              childAspectRatio: 0.65,
              crossAxisSpacing: 20.w,
              mainAxisSpacing: 16.h,
            ),
            itemBuilder: (context, index) => MovieCard(
              movieId: suggestionMovies[index].imdbCode,
              imagePath: suggestionMovies[index].mediumCoverImage ?? '',
              rating: suggestionMovies[index].rating,
            ),
            itemCount: suggestionMovies.length,
          )
        ],
      ),
    );
  }
}
