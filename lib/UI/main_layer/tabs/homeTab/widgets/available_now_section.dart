import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import 'data/movies_data.dart';
import 'watch_now_banner.dart';
import 'available_now_movie_card.dart';

class AvailableNowSection extends StatefulWidget {
  const AvailableNowSection({super.key});

  @override
  State<AvailableNowSection> createState() => _AvailableNowSectionState();
}

class _AvailableNowSectionState extends State<AvailableNowSection> {
  int _currentIndex = 1;
  String bgImage = availableNowMovies[1]['image']!;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (rect) {
            return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.black.withAlpha(204),
                AppColors.black.withAlpha(153),
                Colors.black,
              ],
              stops: [0.0, 0.5, 1.0],
            ).createShader(rect);
          },
          blendMode: BlendMode.darken,
          child: Image.asset(
            bgImage,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        SafeArea(
          bottom: false,
          child: Column(
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Image.asset(
                  AppAssets.availableNow,
                  width: 267.w,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 10),
              CarouselSlider.builder(
                itemCount: availableNowMovies.length,
                itemBuilder: (context, index, realIdx) {
                  final movie = availableNowMovies[index];
                  final isCenter = index == _currentIndex;

                  return AvailableNowMovieCard(
                    movie: movie,
                    isCenter: isCenter,
                  );
                },
                options: CarouselOptions(
                  height: 350.h,
                  enlargeCenterPage: true,
                  viewportFraction: 0.6,
                  initialPage: _currentIndex,
                  enableInfiniteScroll: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                      bgImage = availableNowMovies[_currentIndex]['image']!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              const WatchNowBanner(),
            ],
          ),
        ),
      ],
    );
  }
}
