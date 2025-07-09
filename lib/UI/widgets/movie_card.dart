import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/UI/movieDetails/view/movie_details_screen.dart';
import 'package:movies_app/core/utils/app_assets.dart';

import '../../core/utils/app_colors.dart';

class MovieCard extends StatelessWidget {
  final String imagePath;
  final double? rating;
  final String? movieId;

  const MovieCard({
    super.key,
    required this.imagePath,
    this.rating,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Navigator.of(context).pushNamed(
          MovieDetailsScreen.routeName,
          arguments: movieId,
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
              rating == null || rating == 0
                  ? SizedBox.shrink()
                  : Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
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
