import 'package:flutter/material.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/model/movies_list_response.dart';
import 'package:movies_app/UI/main_layer/tabs/profileTab/widgets/profile_tab_body/widgets/history_tab.dart';
import 'package:movies_app/UI/main_layer/tabs/profileTab/widgets/profile_tab_body/widgets/watch_list_tab.dart';

import '../../models/get_favourite_movies_response_model.dart';

class ProfileTabBody extends StatelessWidget {
  final TabController controller;
  final List<FavouriteMovie>? favouriteMovies;

  const ProfileTabBody(
      {super.key, required this.controller, required this.favouriteMovies});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: controller,
      children: [
        WatchListTab(favouriteMovies: favouriteMovies,),
        HistoryTab(),
      ],
    );
  }
}
