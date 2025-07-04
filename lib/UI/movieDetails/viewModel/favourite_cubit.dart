import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/model/movies_list_response.dart';

import 'package:movies_app/UI/movieDetails/model/movie_details_api.dart';
import 'package:movies_app/UI/movieDetails/viewModel/favourite_cubit_states.dart';

class FavouriteCubit extends Cubit<FavouriteCubitStates> {
  FavouriteCubit() : super(FavouriteInitialState());
  late bool isFav;
  editMovieFav(BuildContext context, Movies movie) async {
    isFav = movie.isFav;

    if (movie.isFav) {
      try {
        String message =
            await MovieDetailsApi.removeMovieFromFav(movie, context);
        movie.isFav = false;
        isFav = movie.isFav;
        emit(FavouriteSuccessState(message: message, isFav: isFav));
        print(message);
      } catch (e) {
        emit(FavouriteFailureState(message: e.toString()));
      }
    } else {
      try {
        String message = await MovieDetailsApi.addMovieToFav(movie, context);
        movie.isFav = true;
        isFav = movie.isFav;
        emit(FavouriteSuccessState(message: message, isFav: isFav));
        print(message);
      } catch (e) {
        emit(FavouriteFailureState(message: e.toString()));
        print(e.toString());
      }
    }
  }

  // void setInitialValue(bool value) {
  //   isFav = value;
  //   emit(AddMovieToFavSuccessState(isFav: isFav));
  // }
}
