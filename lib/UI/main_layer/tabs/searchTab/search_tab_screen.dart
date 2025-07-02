import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/UI/main_layer/tabs/searchTab/modelView/search_movies_cubit.dart';
import 'package:movies_app/UI/main_layer/tabs/searchTab/modelView/search_movies_state.dart';
import 'package:movies_app/UI/main_layer/tabs/searchTab/widgets/custom_search_field.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import '../../../widgets/movie_card.dart';

class SearchTabScreen extends StatefulWidget {
  const SearchTabScreen({super.key});

  @override
  State<SearchTabScreen> createState() => _SearchTabScreenState();
}

class _SearchTabScreenState extends State<SearchTabScreen> {
  late SearchMoviesCubit _searchCubit;
  final TextEditingController _controller = TextEditingController();
  bool hasSearched = false;

  @override
  void initState() {
    super.initState();
    _searchCubit = SearchMoviesCubit();
  }

  void _onSearch(String value) {
    if (value.trim().isEmpty) return;
    setState(() => hasSearched = true);
    _searchCubit.searchMovies(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black1,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              CustomSearchField(
                controller: _controller,
                onSubmitted: _onSearch,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: BlocBuilder<SearchMoviesCubit, SearchMoviesState>(
                  bloc: _searchCubit,
                  builder: (context, state) {
                    if (!hasSearched) {
                      return Center(
                        child: Image.asset(
                          AppAssets.empty,
                          width: 160,
                          fit: BoxFit.contain,
                        ),
                      );
                    } else if (state is SearchLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.amber,
                        ),
                      );
                    } else if (state is SearchError) {
                      return Center(child: Text(state.message));
                    } else if (state is SearchEmpty) {
                      return Center(
                        child: Image.asset(
                          AppAssets.empty,
                          width: 160,
                          fit: BoxFit.contain,
                        ),
                      );
                    } else if (state is SearchSuccess) {
                      final movies = state.movies;
                      return GridView.builder(
                        itemCount: movies.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.65,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                        itemBuilder: (context, index) {
                          final movie = movies[index];
                          return MovieCard(
                            imagePath: movie.mediumCoverImage ?? '',
                            rating: movie.rating,
                          );
                        },
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
