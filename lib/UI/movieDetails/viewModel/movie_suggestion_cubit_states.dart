import 'package:movies_app/UI/main_layer/tabs/homeTab/model/movies_list_response.dart';

sealed class MovieSuggestionCubitStates {}

class MovieSuggestionInitialState extends MovieSuggestionCubitStates {}

class MovieSuggestionLoadingState extends MovieSuggestionCubitStates {}

class MovieSuggestionFailureState extends MovieSuggestionCubitStates {
  final String? message;

  MovieSuggestionFailureState({required this.message});
}

class MovieSuggestionSuccessEmptyListState extends MovieSuggestionCubitStates {
  final List<Movies> movies = [];
}

class MovieSuggestionSuccessState extends MovieSuggestionCubitStates {
  final List<Movies> movies;

  MovieSuggestionSuccessState({required this.movies});
}
