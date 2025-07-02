import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/UI/movieDetails/view/views/cast_section_view.dart';
import 'package:movies_app/UI/movieDetails/view/views/geners_section_view.dart';
import 'package:movies_app/UI/movieDetails/view/views/movie_section_view.dart';
import 'package:movies_app/UI/movieDetails/view/views/screen_shots_section_view.dart';
import 'package:movies_app/UI/movieDetails/view/views/similar_section_view.dart';
import 'package:movies_app/UI/movieDetails/view/views/summary_section_view.dart';
import 'package:movies_app/UI/movieDetails/view/widgets/coustom_watch_elevated_boutton.dart';
import 'package:movies_app/UI/movieDetails/view/widgets/coustome_information_container.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const String routeName = '/movieDetailsScreen';
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        //TODO:Logic
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Icon(
            Icons.arrow_back_ios,
            size: 30,
          ),
        ),
        actions: [
          Icon(
            Icons.bookmark,
            size: 30,
          ),
          SizedBox(
            width: 22,
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.white,
      ),
      body: ListView(
        children: [
          MovieSectionView(), //take obgect of movie
          CustomWatchElevatedButton(
            title: 'Watch',
            onPressed: () {},
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            //take 3 data
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CoustomeInformationContainer(
                  icon: AppAssets.loveIcon, data: '15'),
              CoustomeInformationContainer(
                  icon: AppAssets.watchIcon, data: '90'),
              CoustomeInformationContainer(
                  icon: AppAssets.starIcon, data: '7.6'),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          ScreenShotsSectionView(
              //take 3 screen shots
              screenShot1:
                  "https://yts.mx/assets/images/movies/Titanic_1997/large-screenshot1.jpg",
              screenShot2:
                  "https://yts.mx/assets/images/movies/Titanic_1997/large-screenshot2.jpg",
              screenShot3:
                  "https://yts.mx/assets/images/movies/Titanic_1997/large-screenshot3.jpg"),
          SizedBox(
            height: 16,
          ),
          SimilarSectionView(), //take list of suggestMovies
          SizedBox(
            height: 16,
          ),
          SummarySectionView(), //summary
          SizedBox(
            height: 16,
          ),
          CastSectionView(), //list of cast
          SizedBox(
            height: 16,
          ),
          GenersSectionView(), //list of geners
          SizedBox(
            height: 50.h,
          ),
        ],
      ),
    );
  }
}
