import 'package:movies_app/UI/main_layer/tabs/homeTab/model/movies_list_response.dart';

sealed class MoviesListCubitStates {}

class MoviesListInitialState extends MoviesListCubitStates {}

class MoviesListLoadingState extends MoviesListCubitStates {}

class MoviesListFailureState extends MoviesListCubitStates {
  final String? message;

  MoviesListFailureState({required this.message});
}

class MoviesListSucessState extends MoviesListCubitStates {
  final List<Movies>? movies;

  MoviesListSucessState({required this.movies});
}

class MoviesListSucessEmptyListState extends MoviesListCubitStates {
  final List<Movies>? movies = [];
}
