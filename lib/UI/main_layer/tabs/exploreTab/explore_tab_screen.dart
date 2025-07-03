import 'package:flutter/material.dart';
import 'package:movies_app/UI/main_layer/provider/selected_cat_provider.dart';
import 'package:movies_app/UI/main_layer/tabs/exploreTab/modelView/explore_movies_cubit.dart';
import 'package:movies_app/UI/main_layer/tabs/exploreTab/widgets/explore_movies_grid.dart';
import 'package:movies_app/UI/main_layer/tabs/exploreTab/widgets/genre_selector.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:provider/provider.dart';

class ExploreTabScreen extends StatefulWidget {
  const ExploreTabScreen({
    super.key,
  });

  @override
  State<ExploreTabScreen> createState() => _ExploreTabScreenState();
}

class _ExploreTabScreenState extends State<ExploreTabScreen>
    with AutomaticKeepAliveClientMixin {
  final genres = AppConstants.genresList;

  int selectedGenreIndex = 0;
  late ExploreMoviesCubit exploreCubit;

  @override
  void initState() {
    super.initState();

    final provider = Provider.of<SelectedCatProvider>(context, listen: false);

    selectedGenreIndex = provider.selectedCat;
    exploreCubit = ExploreMoviesCubit();
    exploreCubit.fetchMovies(genres[selectedGenreIndex]);
  }

  @override
  void didUpdateWidget(covariant ExploreTabScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    exploreCubit.fetchMovies(genres[selectedGenreIndex]);
  }

  @override
  bool get wantKeepAlive => false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          const SizedBox(height: 12),
          GenreSelector(
            genres: genres,
            selectedIndex: selectedGenreIndex,
            onGenreSelected: (index) {
              setState(() {
                selectedGenreIndex = index;
              });
              exploreCubit.fetchMovies(genres[index]);
            },
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: ExploreMoviesGrid(exploreCubit: exploreCubit),
            ),
          ),
        ],
      ),
    );
  }
}
