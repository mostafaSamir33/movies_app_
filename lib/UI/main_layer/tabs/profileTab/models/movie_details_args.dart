import '../../homeTab/model/movies_list_response.dart';
import 'get_favourite_movies_response_model.dart';

class MovieDetailsArgs {
  final Movies? movie;
  final FavouriteMovie? favourite;

  const MovieDetailsArgs({this.movie, this.favourite});
}
