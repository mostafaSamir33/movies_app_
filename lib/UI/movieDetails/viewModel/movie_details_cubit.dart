import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/UI/main_layer/tabs/profileTab/network/watch_list_and_history_movies_api.dart';
import 'package:movies_app/UI/movieDetails/model/movie_details_api.dart';
import 'package:movies_app/UI/movieDetails/model/movie_details_model.dart';
import 'package:movies_app/UI/movieDetails/viewModel/movie_details_cubit_states.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsCubitStates> {
  MovieDetailsCubit() : super(MovieDetailsInitialState());
  bool isMarked = false;
  getMovieDetails(String movieId, BuildContext context) async {
    emit(MovieDetailsLoadingState());
    try {
      MovieDetails? movie = await MovieDetailsApi.getMovieDetails(movieId);
      isMarked =
          await WatchListAndHistoryMoviesApi.movieIsFav(movieId, context);
      if (movie == null) {
        emit(MovieDetailsFailureState(message: 'something went wrong'));
      }
      emit(MovieDetailsSuccessState(movie: movie!, isMarked: isMarked));
    } catch (e) {
      emit(MovieDetailsFailureState(message: e.toString()));
    }
  }
}
