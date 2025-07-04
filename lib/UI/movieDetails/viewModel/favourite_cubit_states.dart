sealed class FavouriteCubitStates {}

class FavouriteInitialState extends FavouriteCubitStates {}

class FavouriteFailureState extends FavouriteCubitStates {
  final String message;

  FavouriteFailureState({required this.message});
}

class FavouriteSuccessState extends FavouriteCubitStates {
  final String? message;
  bool? isFav;

  FavouriteSuccessState({this.message, this.isFav});
}
