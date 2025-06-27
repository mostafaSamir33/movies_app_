import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/widgets/watch_now_banner.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import 'data/movies_data.dart';

class AvailableNowSection extends StatelessWidget {
  const AvailableNowSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (rect) {
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black54, Colors.black],
              stops: [0.0, 0.5, 1.0],
            ).createShader(rect);
          },
          blendMode: BlendMode.darken,
          child: Image.asset(
            AppAssets.film1917,
            width: double.infinity,
            height: 500,
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Image.asset(
                    AppAssets.availableNow,
                    width: double.infinity,
                    height: 70,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 270,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: availableNowMovies.length,
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    itemBuilder: (context, index) {
                      final isCenter = index == 1;
                      final movie = availableNowMovies[index];

                      return Padding(
                        padding: EdgeInsets.only(right: 20, top: isCenter ? 0 : 20),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                movie['image']!,
                                width: isCenter ? 170 : 130,
                                height: isCenter ? 240 : 210,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(Icons.star, size: 14,color: AppColors.amber,),
                                    const SizedBox(width: 2),
                                    Text(
                                      movie['rating']!,
                                      style: GoogleFonts.poppins(color: AppColors.white, fontSize: 12),
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
                ),
                const SizedBox(height: 10),
                const WatchNowBanner(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
