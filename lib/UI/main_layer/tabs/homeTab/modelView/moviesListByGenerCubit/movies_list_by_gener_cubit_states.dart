import 'package:movies_app/UI/main_layer/tabs/homeTab/model/movies_list_response.dart';

sealed class MoviesListByGenerCubitStates {}

class MoviesListByGenerInitialState extends MoviesListByGenerCubitStates {}

class MoviesListByGenerLoadingState extends MoviesListByGenerCubitStates {}

class MoviesListByGenerFailureState extends MoviesListByGenerCubitStates {
  final String? message;

  MoviesListByGenerFailureState({required this.message});
}

class MoviesListByGenerSucessState extends MoviesListByGenerCubitStates {
  final List<Movies>? moviesSection1;
  final List<Movies>? moviesSection2;
  final List<Movies>? moviesSection3;

  MoviesListByGenerSucessState(
      {required this.moviesSection1,
      required this.moviesSection2,
      required this.moviesSection3});
}

class MoviesListByGenerSucessEmptyListState
    extends MoviesListByGenerCubitStates {
  final List<Movies>? moviesSection1 = [];
  final List<Movies>? moviesSection2 = [];
  final List<Movies>? moviesSection3 = [];
}
