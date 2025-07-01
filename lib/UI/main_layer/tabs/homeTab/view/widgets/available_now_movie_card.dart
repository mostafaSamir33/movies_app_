import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/model/movies_list_response.dart';
import '../../../../../../core/utils/app_colors.dart';

class AvailableNowMovieCard extends StatelessWidget {
  final Movies movie;
  final bool isCenter;

  const AvailableNowMovieCard({
    super.key,
    required this.movie,
    required this.isCenter,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 6.w,
        vertical: isCenter ? 0 : 15.h,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              movie.largeCoverImage ?? '',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(178),
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, size: 15, color: AppColors.amber),
                  const SizedBox(width: 2),
                  Text(
                    (movie.rating ?? 0).toString(),
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
