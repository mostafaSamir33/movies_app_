import 'package:flutter/material.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/widgets/available_now_section.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/widgets/category_movies_section.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/widgets/data/movies_data.dart';

class HomeTabScreen extends StatelessWidget {
  const HomeTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AvailableNowSection(),
            const SizedBox(height: 32),
            CategoryMoviesSection(title: "Action", movies: actionMovies),
            const SizedBox(height: 24),
            CategoryMoviesSection(title: "Adventure", movies: actionMovies),
            const SizedBox(height: 24),
            CategoryMoviesSection(title: "Drama", movies: actionMovies),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
