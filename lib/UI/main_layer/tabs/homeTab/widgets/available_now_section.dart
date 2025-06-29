import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/widgets/watch_now_banner.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import 'data/movies_data.dart';

class AvailableNowSection extends StatefulWidget {
  const AvailableNowSection({super.key});

  @override
  State<AvailableNowSection> createState() => _AvailableNowSectionState();
}

class _AvailableNowSectionState extends State<AvailableNowSection> {
  final PageController _pageController =
      PageController(initialPage: 1, viewportFraction: 0.6);
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
                Colors.black
              ],
              stops: [0.0, 0.5, 1.0],
            ).createShader(rect);
          },
          blendMode: BlendMode.darken,
          child: Image.asset(
            bgImage,
            width: double.infinity,
            // height: 500,
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
                  //height: 70,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 350.h,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: availableNowMovies.length,
                  onPageChanged: (value) {
                    _currentIndex = value;
                    bgImage = availableNowMovies[_currentIndex]['image']!;
                    setState(() {});
                  },
                  itemBuilder: (context, index) {
                    final movie = availableNowMovies[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: index == _currentIndex ? 0 : 20),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              movie['image']!,
                              //width: index == _currentIndex ? 230.w : 180.w,
                              //height: index == _currentIndex ? 350.h : 270.h,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.black.withAlpha(178),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.star,
                                    size: 14,
                                    color: AppColors.amber,
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    movie['rating']!,
                                    style: GoogleFonts.poppins(
                                        color: AppColors.white, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                // ListView.builder(
                //   scrollDirection: Axis.horizontal,
                //   itemCount: availableNowMovies.length,
                //   padding: const EdgeInsets.symmetric(horizontal: 32),
                //   itemBuilder: (context, index) {
                //     final isCenter = index == 1;
                //     final movie = availableNowMovies[index];

                //     return Padding(
                //       padding:
                //           EdgeInsets.only(right: 20, top: isCenter ? 0 : 20),
                //       child: Stack(
                //         children: [
                //           ClipRRect(
                //             borderRadius: BorderRadius.circular(20),
                //             child: Image.asset(
                //               movie['image']!,
                //               width: isCenter ? 170 : 130,
                //               height: isCenter ? 240 : 210,
                //               fit: BoxFit.cover,
                //             ),
                //           ),
                //           Positioned(
                //             top: 10,
                //             right: 10,
                //             child: Container(
                //               padding: const EdgeInsets.symmetric(
                //                   horizontal: 6, vertical: 2),
                //               decoration: BoxDecoration(
                //                 color: Colors.black.withOpacity(0.7),
                //                 borderRadius: BorderRadius.circular(6),
                //               ),
                //               child: Row(
                //                 children: [
                //                   const Icon(
                //                     Icons.star,
                //                     size: 14,
                //                     color: AppColors.amber,
                //                   ),
                //                   const SizedBox(width: 2),
                //                   Text(
                //                     movie['rating']!,
                //                     style: GoogleFonts.poppins(
                //                         color: AppColors.white, fontSize: 12),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     );
                //   },
                // ),
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
