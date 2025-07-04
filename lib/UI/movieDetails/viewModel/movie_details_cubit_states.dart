import 'package:movies_app/UI/movieDetails/model/movie_details_model.dart';

sealed class MovieDetailsCubitStates {}

class MovieDetailsInitialState extends MovieDetailsCubitStates {}

class MovieDetailsLoadingState extends MovieDetailsCubitStates {}

class MovieDetailsFailureState extends MovieDetailsCubitStates {
  String? message;

  MovieDetailsFailureState({required this.message});
}

class MovieDetailsSuccessState extends MovieDetailsCubitStates {
  MovieDetails movie;

  MovieDetailsSuccessState({required this.movie});
}
