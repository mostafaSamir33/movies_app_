import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/UI/movieDetails/model/movie_details_model.dart';
import 'package:movies_app/UI/movieDetails/view/views/cast_section_view.dart';
import 'package:movies_app/UI/movieDetails/view/views/geners_section_view.dart';
import 'package:movies_app/UI/movieDetails/view/views/movie_section_view.dart';
import 'package:movies_app/UI/movieDetails/view/views/screen_shots_section_view.dart';
import 'package:movies_app/UI/movieDetails/view/views/similar_section_view.dart';
import 'package:movies_app/UI/movieDetails/view/views/summary_section_view.dart';
import 'package:movies_app/UI/movieDetails/view/widgets/coustom_watch_elevated_boutton.dart';
import 'package:movies_app/UI/movieDetails/view/widgets/coustome_information_container.dart';
import 'package:movies_app/UI/movieDetails/viewModel/movie_details_cubit.dart';
import 'package:movies_app/UI/movieDetails/viewModel/movie_details_cubit_states.dart';
import 'package:movies_app/UI/movieDetails/viewModel/movie_suggestion_cubit.dart';
import 'package:movies_app/UI/movieDetails/viewModel/movie_suggestion_cubit_states.dart';
import 'package:movies_app/core/extentions/context_extention.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';

import '../../../core/utils/app_constants.dart';
import '../../../core/utils/app_prefs.dart';
import '../../../core/utils/custom_text_styles.dart';
import '../../main_layer/tabs/profileTab/network/watch_list_and_history_movies_api.dart';
import '../model/movie_details_api.dart';

class MovieDetailsScreen extends StatefulWidget {
  final String movieId;
  static const String routeName = '/movieDetailsScreen';

  const MovieDetailsScreen({
    super.key,
    required this.movieId,
  });

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  MovieDetails? movieDetails;

  @override
  void initState() {
    super.initState();

    setState(() {});
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      movieDetails = await MovieDetailsApi.getMovieDetails(widget.movieId);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDetailsCubit(),
      child: BlocBuilder<MovieDetailsCubit, MovieDetailsCubitStates>(
        bloc: MovieDetailsCubit()
          ..getMovieDetails(movieDetails?.imdbCode ?? '', context),
        builder: (context, state) {
          switch (state) {
            case MovieDetailsInitialState():
            case MovieDetailsLoadingState():
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.amber,
                  ),
                ),
              );
            case MovieDetailsFailureState():
              return Scaffold(
                body: Center(
                  child: Text(state.message ?? ''),
                ),
              );
            case MovieDetailsSuccessState():
              final showAppBarButtons = true;
              bool isMarked = state.isMarked;
              MovieDetails movieDetails = state.movie;

              return Scaffold(
                  extendBodyBehindAppBar: true,
                  appBar: AppBar(
                    leading: Visibility(
                      visible: showAppBarButtons,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    actions: [
                      Visibility(
                        visible: showAppBarButtons,
                        child: IconButton(
                            onPressed: () async {
                              if (isMarked) {
                                isMarked = false;
                                setState(() {});
                                await WatchListAndHistoryMoviesApi
                                    .removeMovieFromFav(
                                        movieDetails.imdbCode ?? '', context);
                              } else {
                                isMarked = true;
                                setState(() {});
                                await WatchListAndHistoryMoviesApi
                                    .postWatchListMovies(
                                        context: context,
                                        movieId: movieDetails.imdbCode ?? '',
                                        name: movieDetails.title ?? '',
                                        rating: movieDetails.rating ?? 0.0,
                                        imageURL:
                                            movieDetails.largeCoverImage ?? '',
                                        year: (movieDetails.year ?? 0)
                                            .toString());
                              }
                            },
                            icon: isMarked
                                ? Icon(
                                    Icons.bookmark,
                                    size: 30,
                                    color: AppColors.amber,
                                  )
                                : Icon(
                                    Icons.bookmark,
                                    size: 30,
                                  )),
                      ),
                      SizedBox(
                        width: 22,
                      )
                    ],
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    foregroundColor: AppColors.white,
                  ),
                  body: _buildBody(movieDetails));
          }
        },
      ),
    );
  }

  Widget _buildBody(MovieDetails movieDetails) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        MovieSectionView(
          movie: movieDetails,
        ),
        CustomWatchElevatedButton(
          title: context.getLocalization().watch,
          onPressed: () async {
            MovieDetails? watchedMovie =
                await MovieDetailsApi.getMovieDetails(widget.movieId);

            await AppPrefs.historySetSetOfString(
                key: AppConstants.historyTabKey, watchedMovie: watchedMovie);

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                context.getLocalization().youAreGoingToWatchTheMovie,
                style: CustomTextStyles.style20w600
                    .copyWith(color: AppColors.black1),
              ),
              backgroundColor: AppColors.yellow,
            ));
          },
        ),
        SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 50.h,
          child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                "https://yts.mx/assets/images/movies/Titanic_1997/large-screenshot1.jpg",
            screenShot2: movieDetails.largeScreenshotImage2 ??
                'https://img.freepik.com/premium-vector/default-image-icon-vector-missing-picture-page-website-design-mobile-app-no-photo-available_87543-11093.jpg',
            screenShot3: movieDetails.largeScreenshotImage3 ??
                'https://img.freepik.com/premium-vector/default-image-icon-vector-missing-picture-page-website-design-mobile-app-no-photo-available_87543-11093.jpg'),
        SizedBox(
          height: 16,
        ),
        BlocProvider(
            create: (context) => MovieSuggestionCubit(),
            child:
                BlocBuilder<MovieSuggestionCubit, MovieSuggestionCubitStates>(
              bloc: MovieSuggestionCubit()
                ..getMovieSuggestion(movieDetails.id.toString()),
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
                      child: Text(context.getLocalization().nomovies),
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
}
