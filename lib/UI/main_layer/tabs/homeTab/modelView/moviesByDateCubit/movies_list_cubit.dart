import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/model/movies_list_api.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/model/movies_list_response.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/modelView/moviesByDateCubit/movies_list_cubit_states.dart';

class MoviesListCubit extends Cubit<MoviesListCubitStates> {
  MoviesListCubit() : super(MoviesListInitialState());
  getMoviesListByDate() async {
    emit(MoviesListLoadingState());
    try {
      List<Movies>? moviesList = await MoviesListApi.getListMoviesByDate();
      if (moviesList == null || moviesList.isEmpty) {
        emit(MoviesListSucessEmptyListState());
        return;
      }
      emit(MoviesListSucessState(movies: moviesList));
    } catch (e) {
      //TODO : handling error cases
      emit(MoviesListFailureState(message: e.toString()));
    }
  }
}
