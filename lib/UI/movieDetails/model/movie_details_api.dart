import 'dart:convert';

import 'package:movies_app/UI/movieDetails/model/movie_details_model.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/core/utils/app_endpoints.dart';
import 'package:http/http.dart' as http;

class MovieDetailsApi {
  static Future<MovieDetails?> getMovieDetails(String movieId) async {
    Uri uri = Uri.https(
        AppConstants.moviesBaseUrl, AppEndpoints.movieDetailsEndpoint, {
      'imdb_id': movieId,
    });
    var response = await http.get(uri);
    var jsonResponse = jsonDecode(response.body);
    MovieDetailsModel data = MovieDetailsModel.fromJson(jsonResponse);
    if (data.status == 'ok' && response.statusCode == 200) {
      return data.data?.movie;
    } else {
      throw data.statusMessage ?? 'Something went wrong';
    }
  }
}
