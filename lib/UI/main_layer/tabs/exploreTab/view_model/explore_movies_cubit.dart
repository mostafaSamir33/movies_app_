import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/model/movies_list_response.dart';
import '../data/explore_movies_api.dart';

abstract class ExploreMoviesState {}

class ExploreMoviesInitial extends ExploreMoviesState {}

class ExploreMoviesLoading extends ExploreMoviesState {}

class ExploreMoviesLoaded extends ExploreMoviesState {
  final List<Movies> movies;

  ExploreMoviesLoaded(this.movies);
}

class ExploreMoviesEmpty extends ExploreMoviesState {}

class ExploreMoviesError extends ExploreMoviesState {
  final String message;

  ExploreMoviesError(this.message);
}

class ExploreMoviesCubit extends Cubit<ExploreMoviesState> {
  ExploreMoviesCubit() : super(ExploreMoviesInitial());

  Future<void> fetchMovies(String genre) async {
    emit(ExploreMoviesLoading());
    try {
      final movies = await ExploreMoviesApi.getMoviesByGenre(genre);
      if (movies == null || movies.isEmpty) {
        emit(ExploreMoviesEmpty());
      } else {
        emit(ExploreMoviesLoaded(movies));
      }
    } catch (e) {
      emit(ExploreMoviesError(e.toString()));
    }
  }
}
