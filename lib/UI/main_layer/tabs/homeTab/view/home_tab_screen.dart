import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/model/movies_list_response.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/modelView/moviesByDateCubit/movies_list_cubit.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/modelView/moviesByDateCubit/movies_list_cubit_states.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/modelView/moviesListByGenerCubit/movies_list_by_gener_cubit.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/view/widgets/available_now_section.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/view/widgets/category_movies_section.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/view/widgets/data/movies_data.dart';

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
            BlocProvider(
                create: (context) => MoviesListCubit()..getMoviesListByDate(),
                child: BlocBuilder<MoviesListCubit, MoviesListCubitStates>(
                  builder: (context, state) {
                    switch (state) {
                      case MoviesListInitialState():
                      case MoviesListLoadingState():
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      case MoviesListFailureState():
                        return Center(
                          child: Text('${state.message}'),
                        );
                      case MoviesListSucessEmptyListState():
                        return Center(
                          child: Text('No Movies'),
                        );
                      case MoviesListSucessState():
                        final List<Movies> movies = state.movies!;
                        return AvailableNowSection(
                          movies: movies,
                        );
                    }
                  },
                )), //list
            const SizedBox(height: 32),
            CategoryMoviesSection(
                title: selectedCategories[0], movies: actionMovies),
            const SizedBox(height: 24),
            CategoryMoviesSection(
                title: selectedCategories[1], movies: actionMovies),
            const SizedBox(height: 24),
            CategoryMoviesSection(
                title: selectedCategories[2], movies: actionMovies),
            const SizedBox(height: 40),
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
