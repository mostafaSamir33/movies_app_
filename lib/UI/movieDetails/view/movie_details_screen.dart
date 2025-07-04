import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/model/movies_list_response.dart';
import 'package:movies_app/UI/movieDetails/model/movie_details_model.dart';
import 'package:movies_app/UI/movieDetails/view/views/cast_section_view.dart';
import 'package:movies_app/UI/movieDetails/view/views/geners_section_view.dart';
import 'package:movies_app/UI/movieDetails/view/views/movie_section_view.dart';
import 'package:movies_app/UI/movieDetails/view/views/screen_shots_section_view.dart';
import 'package:movies_app/UI/movieDetails/view/views/similar_section_view.dart';
import 'package:movies_app/UI/movieDetails/view/views/summary_section_view.dart';
import 'package:movies_app/UI/movieDetails/view/widgets/coustom_watch_elevated_boutton.dart';
import 'package:movies_app/UI/movieDetails/view/widgets/coustome_information_container.dart';
import 'package:movies_app/UI/movieDetails/viewModel/favourite_cubit.dart';

import 'package:movies_app/UI/movieDetails/viewModel/movie_details_cubit.dart';
import 'package:movies_app/UI/movieDetails/viewModel/movie_details_cubit_states.dart';
import 'package:movies_app/UI/movieDetails/viewModel/movie_suggestion_cubit.dart';
import 'package:movies_app/UI/movieDetails/viewModel/movie_suggestion_cubit_states.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class MovieDetailsScreen extends StatefulWidget {
  static const String routeName = '/movieDetailsScreen';

  const MovieDetailsScreen({super.key, required this.movie});

  final Movies movie;

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FavouriteCubit>().isFav = widget.movie.isFav;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        //TODO:Logic
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Icon(
              Icons.arrow_back_ios,
              size: 30,
            ),
          ),
        ),
        actions: [
          GestureDetector(
              onTap: () {
                context
                    .read<FavouriteCubit>()
                    .editMovieFav(context, widget.movie);
              },
              child: context.watch<FavouriteCubit>().isFav
                  ? Icon(
                      Icons.bookmark,
                      size: 30,
                      color: AppColors.amber,
                    )
                  : Icon(
                      Icons.bookmark,
                      size: 30,
                    )

              // widget.movie.isFav
              //     ? Icon(
              //         Icons.bookmark,
              //         size: 30,
              //         color: AppColors.amber,
              //       )
              //     : Icon(
              //         Icons.bookmark,
              //         size: 30,
              //       ),
              ),
          SizedBox(
            width: 22,
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.white,
      ),
      body: BlocProvider(
        create: (context) => MovieDetailsCubit(),
        child: BlocBuilder<MovieDetailsCubit, MovieDetailsCubitStates>(
            bloc: MovieDetailsCubit()
              ..getMovieDetails(widget.movie.imdbCode ?? ''),
            builder: (context, state) {
              switch (state) {
                case MovieDetailsInitialState():
                case MovieDetailsLoadingState():
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.amber,
                    ),
                  );
                case MovieDetailsFailureState():
                  return Center(
                    child: Text('Error:${state.message}'),
                  );
                case MovieDetailsSuccessState():
                  MovieDetails movieDetails = state.movie;
                  print(widget.movie.imdbCode);
                  return ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      MovieSectionView(
                        movie: movieDetails,
                      ), //take obgect of movie
                      CustomWatchElevatedButton(
                        title: 'Watch',
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 50.h,
                        child: ListView(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            scrollDirection: Axis.horizontal,
                            children: [
                              movieDetails.likeCount == null
                                  ? SizedBox()
                                  : CoustomeInformationContainer(
                                      icon: AppAssets.loveIcon,
                                      data: movieDetails.likeCount.toString()),
                              SizedBox(
                                width: 16,
                              ),
                              movieDetails.runtime == null
                                  ? SizedBox()
                                  : CoustomeInformationContainer(
                                      icon: AppAssets.watchIcon,
                                      data: movieDetails.runtime.toString()),
                              SizedBox(
                                width: 16,
                              ),
                              movieDetails.rating == null
                                  ? SizedBox()
                                  : CoustomeInformationContainer(
                                      icon: AppAssets.starIcon,
                                      data: movieDetails.rating.toString()),
                            ]),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      ScreenShotsSectionView(
                          screenShot1: movieDetails.largeScreenshotImage1 ??
                              'https://img.freepik.com/premium-vector/default-image-icon-vector-missing-picture-page-website-design-mobile-app-no-photo-available_87543-11093.jpg',
                          screenShot2: movieDetails.largeScreenshotImage2 ??
                              'https://img.freepik.com/premium-vector/default-image-icon-vector-missing-picture-page-website-design-mobile-app-no-photo-available_87543-11093.jpg',
                          screenShot3: movieDetails.largeScreenshotImage3 ??
                              'https://img.freepik.com/premium-vector/default-image-icon-vector-missing-picture-page-website-design-mobile-app-no-photo-available_87543-11093.jpg'),
                      SizedBox(
                        height: 16,
                      ),
                      BlocProvider(
                          create: (context) => MovieSuggestionCubit(),
                          child: BlocBuilder<MovieSuggestionCubit,
                              MovieSuggestionCubitStates>(
                            bloc: MovieSuggestionCubit()
                              ..getMovieSuggestion(widget.movie.id.toString()),
                            builder: (context, state) {
                              switch (state) {
                                case MovieSuggestionInitialState():
                                case MovieSuggestionLoadingState():
                                  return Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.amber,
                                    ),
                                  );
                                case MovieSuggestionFailureState():
                                  return Center(
                                    child: Text('Error:${state.message}'),
                                  );
                                case MovieSuggestionSuccessEmptyListState():
                                  return Center(
                                    child: Text('No Movies!'),
                                  );
                                case MovieSuggestionSuccessState():
                                  return SimilarSectionView(
                                    suggestionMovies: state.movies,
                                  );
                              }
                            },
                          )),
                      SizedBox(
                        height: 16,
                      ),
                      SummarySectionView(
                        summary: movieDetails.descriptionFull,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      CastSectionView(
                        cast: movieDetails.cast ?? [],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      GenersSectionView(
                        geners: movieDetails.genres,
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                    ],
                  );
              }
            }),
      ),
    );
  }
}
