import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/model/movies_list_api.dart';
import 'search_movies_state.dart';

class SearchMoviesCubit extends Cubit<SearchMoviesState> {
  SearchMoviesCubit() : super(SearchInitial());

  Future<void> searchMovies(String query) async {
    if (query.trim().isEmpty) return;
    emit(SearchLoading());
    try {
      final result = await MoviesListApi.getMoviesByQuery(query);
      if (result == null || result.isEmpty) {
        emit(SearchEmpty());
      } else {
        emit(SearchSuccess(result));
      }
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}
