import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/model/movies_list_api.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/model/movies_list_response.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/modelView/moviesListByGenerCubit/movies_list_by_gener_cubit_states.dart';

class MoviesListByGenerCubit extends Cubit<MoviesListByGenerCubitStates> {
  MoviesListByGenerCubit() : super(MoviesListByGenerInitialState());
  getMoviesListByGener(String gener) async {
    emit(MoviesListByGenerLoadingState());
    try {
      List<Movies>? moviesList =
          await MoviesListApi.getListMoviesByGener(gener);
      if (moviesList == null || moviesList.isEmpty) {
        emit(MoviesListByGenerSucessEmptyListState());
        return;
      }
      emit(MoviesListByGenerSucessState(movies: moviesList));
    } catch (e) {
      //TODO : handling error cases
      emit(MoviesListByGenerFailureState(message: e.toString()));
    }
  }
}
