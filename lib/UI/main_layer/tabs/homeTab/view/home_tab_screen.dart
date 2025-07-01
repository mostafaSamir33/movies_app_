import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/model/movies_list_response.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/modelView/moviesByDateCubit/movies_list_cubit.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/modelView/moviesByDateCubit/movies_list_cubit_states.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/modelView/moviesListByGenerCubit/movies_list_by_gener_cubit.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/modelView/moviesListByGenerCubit/movies_list_by_gener_cubit_states.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/view/widgets/available_now_section.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/view/widgets/category_movies_section.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/view/widgets/category_row.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class HomeTabScreen extends StatelessWidget {
  const HomeTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> geners = [
      'Action',
      'Adventure',
      'Animation',
      'Biography',
      'Comedy',
      'Crime',
      'Documentary',
      'Drama',
      'Family',
      'Fantasy',
      'Film-Noir',
      'Game-Show',
      'History',
      'Horror',
      'Music',
      'Musical',
      'Mystery',
      'News',
      'Reality-TV',
      'Romance',
      'Sci-Fi',
      'Short',
      'Sport',
      'Talk-Show',
      'Thriller',
      'War',
      'Western'
    ];
    List<String> selectedCategories = chooseRandomUniqueCategories(geners, 3);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                BlocProvider(
                    create: (context) =>
                        MoviesListCubit()..getMoviesListByDate(),
                    child: BlocBuilder<MoviesListCubit, MoviesListCubitStates>(
                      builder: (context, state) {
                        switch (state) {
                          case MoviesListInitialState():
                          case MoviesListLoadingState():
                            return SizedBox(
                              height: 350.h,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.amber,
                                ),
                              ),
                            );
                          case MoviesListFailureState():
                            return SizedBox(
                              height: 350.h,
                              child: Center(
                                child: Text('${state.message}'),
                              ),
                            );
                          case MoviesListSucessEmptyListState():
                            return SizedBox(
                              height: 350.h,
                              child: Center(
                                child: Text('No Movies'),
                              ),
                            );
                          case MoviesListSucessState():
                            final List<Movies> movies = state.movies!;
                            return AvailableNowSection(
                              movies: movies,
                            );
                        }
                      },
                    )),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 20),
                    child: Image.asset(
                      AppAssets.availableNow,
                      width: 267.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            CategoryRow(title: selectedCategories[0]), //list
            BlocProvider(
              create: (context) => MoviesListByGenerCubit(),
              child: Column(
                children: [
                  BlocBuilder<MoviesListByGenerCubit,
                          MoviesListByGenerCubitStates>(
                      bloc: MoviesListByGenerCubit()
                        ..getMoviesListByGener(selectedCategories[0]),
                      builder: (context, state) {
                        switch (state) {
                          case MoviesListByGenerInitialState():
                          case MoviesListByGenerLoadingState():
                            return SizedBox(
                              height: 100,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.amber,
                                ),
                              ),
                            );

                          case MoviesListByGenerFailureState():
                            return SizedBox(
                              height: 100,
                              child: Center(
                                child: Text('${state.message}'),
                              ),
                            );

                          case MoviesListByGenerSucessEmptyListState():
                            return SizedBox(
                              height: 100,
                              child: Center(
                                child: Text('No Movies'),
                              ),
                            );
                          case MoviesListByGenerSucessState():
                            final List<Movies> movies = state.movies!;
                            return CategoryMoviesSection(
                                title: selectedCategories[0], movies: movies);
                        }
                      }),
                  const SizedBox(height: 24),
                  CategoryRow(title: selectedCategories[1]),
                  BlocBuilder<MoviesListByGenerCubit,
                          MoviesListByGenerCubitStates>(
                      bloc: MoviesListByGenerCubit()
                        ..getMoviesListByGener(selectedCategories[1]),
                      builder: (context, state) {
                        switch (state) {
                          case MoviesListByGenerInitialState():
                          case MoviesListByGenerLoadingState():
                            return SizedBox(
                              height: 100,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.amber,
                                ),
                              ),
                            );

                          case MoviesListByGenerFailureState():
                            return SizedBox(
                              height: 100,
                              child: Center(
                                child: Text('${state.message}'),
                              ),
                            );

                          case MoviesListByGenerSucessEmptyListState():
                            return SizedBox(
                              height: 100,
                              child: Center(
                                child: Text('No Movies'),
                              ),
                            );
                          case MoviesListByGenerSucessState():
                            final List<Movies> movies = state.movies!;
                            return CategoryMoviesSection(
                                title: selectedCategories[1], movies: movies);
                        }
                      }),
                  const SizedBox(height: 24),
                  CategoryRow(title: selectedCategories[2]),
                  BlocBuilder<MoviesListByGenerCubit,
                          MoviesListByGenerCubitStates>(
                      bloc: MoviesListByGenerCubit()
                        ..getMoviesListByGener(selectedCategories[2]),
                      builder: (context, state) {
                        switch (state) {
                          case MoviesListByGenerInitialState():
                          case MoviesListByGenerLoadingState():
                            return SizedBox(
                              height: 100,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.amber,
                                ),
                              ),
                            );

                          case MoviesListByGenerFailureState():
                            return SizedBox(
                              height: 100,
                              child: Center(
                                child: Text('${state.message}'),
                              ),
                            );

                          case MoviesListByGenerSucessEmptyListState():
                            return SizedBox(
                              height: 100,
                              child: Center(
                                child: Text('No Movies'),
                              ),
                            );
                          case MoviesListByGenerSucessState():
                            final List<Movies> movies = state.movies!;
                            return CategoryMoviesSection(
                                title: selectedCategories[2], movies: movies);
                        }
                      }),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> chooseRandomUniqueCategories(List<String> genres, int count) {
    genres.shuffle();
    return genres.take(count).toList();
  }
}
