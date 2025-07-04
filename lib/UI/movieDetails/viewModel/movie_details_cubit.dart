import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/UI/movieDetails/model/movie_details_api.dart';
import 'package:movies_app/UI/movieDetails/model/movie_details_model.dart';
import 'package:movies_app/UI/movieDetails/viewModel/movie_details_cubit_states.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsCubitStates> {
  MovieDetailsCubit() : super(MovieDetailsInitialState());

  getMovieDetails(String movieId) async {
    emit(MovieDetailsLoadingState());
    try {
      MovieDetails? movie = await MovieDetailsApi.getMovieDetails(movieId);
      if (movie == null) {
        emit(MovieDetailsFailureState(message: 'something went wrong'));
      }
      emit(MovieDetailsSuccessState(movie: movie!));
    } catch (e) {
      emit(MovieDetailsFailureState(message: e.toString()));
    }
  }
}
