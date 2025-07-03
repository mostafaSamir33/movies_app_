import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/model/movies_list_api.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/model/movies_list_response.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/modelView/moviesListByGenerCubit/movies_list_by_gener_cubit_states.dart';

class MoviesListByGenerCubit extends Cubit<MoviesListByGenerCubitStates> {
  MoviesListByGenerCubit() : super(MoviesListByGenerInitialState());
  getMoviesListByGener(String gener1, String gener2, String gener3) async {
    emit(MoviesListByGenerLoadingState());
    try {
      List<Movies>? moviesListSectino1 =
          await MoviesListApi.getListMoviesByGener(gener1);
      List<Movies>? moviesListSectino2 =
          await MoviesListApi.getListMoviesByGener(gener2);
      List<Movies>? moviesListSectino3 =
          await MoviesListApi.getListMoviesByGener(gener3);
      if (moviesListSectino1 == null || moviesListSectino1.isEmpty) {
        emit(MoviesListByGenerSucessEmptyListState());
        return;
      }
      if (moviesListSectino2 == null || moviesListSectino2.isEmpty) {
        emit(MoviesListByGenerSucessEmptyListState());
        return;
      }
      if (moviesListSectino3 == null || moviesListSectino3.isEmpty) {
        emit(MoviesListByGenerSucessEmptyListState());
        return;
      }
      emit(MoviesListByGenerSucessState(
          moviesSection1: moviesListSectino1,
          moviesSection2: moviesListSectino2,
          moviesSection3: moviesListSectino3));
    } catch (e) {
      //TODO : handling error cases
      emit(MoviesListByGenerFailureState(message: e.toString()));
    }
  }
}
