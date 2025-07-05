import 'package:flutter/material.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/model/movies_list_response.dart';

class WatchListAndHistoryProvider extends ChangeNotifier {
  Set<Movies> historyListMovies = {};
}
