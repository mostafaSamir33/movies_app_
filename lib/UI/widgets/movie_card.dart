import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/model/movies_list_response.dart';
import 'package:movies_app/UI/movieDetails/view/movie_details_screen.dart';
import 'package:movies_app/core/utils/app_assets.dart';

import '../../core/utils/app_colors.dart';
import '../main_layer/tabs/profileTab/models/get_favourite_movies_response_model.dart';
import '../main_layer/tabs/profileTab/models/movie_details_args.dart';

class MovieCard extends StatelessWidget {
  final String imagePath;
  final double? rating;
  final Movies? movie;
  final FavouriteMovie? favouriteMovie;

  const MovieCard({
    super.key,
    required this.imagePath,
    this.rating,
    this.movie,
    this.favouriteMovie,
  });

  @override
  Widget build(BuildContext context) {
    log('MovieCard imagePath: $imagePath');
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          MovieDetailsScreen.routeName,
          arguments: MovieDetailsArgs(
            movie: movie,
            favourite: favouriteMovie,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                imagePath,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Image.asset(
                  AppAssets.failedImage,
                  fit: BoxFit.fill,
                  height: 400.h,
                  width: 300.w,
                ),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(
                    child: CircularProgressIndicator(color: AppColors.amber),
                  );
                },
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: rating == null
                      ? SizedBox()
                      : Row(
                          children: [
                            Text(
                              (rating ?? 0).toStringAsFixed(1),
                              style: const TextStyle(
                                color: AppColors.amber,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 3),
                            const Icon(
                              Icons.star,
                              color: AppColors.amber,
                              size: 14,
                            ),
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
