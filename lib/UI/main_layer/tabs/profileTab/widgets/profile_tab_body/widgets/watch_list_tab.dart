import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/app_assets.dart';
import '../../../../../../widgets/movie_card.dart';
import '../../../models/get_favourite_movies_response_model.dart';

class WatchListTab extends StatelessWidget {
  final List<FavouriteMovie>? favouriteMovies;

  const WatchListTab({super.key, required this.favouriteMovies});

  @override
  Widget build(BuildContext context) {
    return favouriteMovies?.isEmpty == true || favouriteMovies == null
        ? Center(
            child: Image.asset(
              AppAssets.emptyList,
              height: 124.h,
              width: 124.w,
            ),
          )
        : GridView.builder(
            itemCount: favouriteMovies?.length ?? 0,
            padding: EdgeInsets.symmetric(vertical: 24.r, horizontal: 16.r),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 122.w / 180.h,
                mainAxisSpacing: 16.4.r,
                crossAxisSpacing: 16.r),
            itemBuilder: (context, index) {
              return MovieCard(
                imagePath: favouriteMovies?[index].imageURL ?? '',
                favouriteMovie: favouriteMovies?[index],
                rating: favouriteMovies?[index].rating,
              );
            },
          );
  }
}
