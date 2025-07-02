import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/UI/main_layer/tabs/exploreTab/modelView/explore_movies_cubit.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/model/movies_list_response.dart';
import 'package:movies_app/UI/widgets/movie_card.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class ExploreMoviesGrid extends StatelessWidget {
  final ExploreMoviesCubit exploreCubit;

  const ExploreMoviesGrid({super.key, required this.exploreCubit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: exploreCubit,
      child: BlocBuilder<ExploreMoviesCubit, ExploreMoviesState>(
        builder: (context, state) {
          if (state is ExploreMoviesLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.amber),
            );
          } else if (state is ExploreMoviesError) {
            return Center(child: Text(state.message));
          } else if (state is ExploreMoviesLoaded) {
            final List<Movies> movies = state.movies;
            return GridView.builder(
              itemCount: movies.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                return MovieCard(
                  imagePath: movies[index].mediumCoverImage ?? '',
                  rating: movies[index].rating,
                );
              },
            );
          } else {
            return const Center(child: Text('No Movies Found'));
          }
        },
      ),
    );
  }
}
