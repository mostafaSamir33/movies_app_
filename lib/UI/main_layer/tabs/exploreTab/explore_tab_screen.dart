import 'package:flutter/material.dart';
import 'package:movies_app/UI/main_layer/tabs/exploreTab/widgets/movie_card.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';

class ExploreTabScreen extends StatefulWidget {
  const ExploreTabScreen({super.key});

  @override
  State<ExploreTabScreen> createState() => _ExploreTabScreenState();
}

class _ExploreTabScreenState extends State<ExploreTabScreen> {
  final List<String> genres = [
    'Action',
    'Adventure',
    'Animation',
    'Biography',
    'Comedy'
  ];
  int selectedGenreIndex = 0;

  final List<String> exploreImages = [
    AppAssets.blackWidow,
    AppAssets.joker,
    AppAssets.ironMan,
    AppAssets.civil,
    AppAssets.avengers,
    AppAssets.doctorStrange,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12),
            SizedBox(
              height: 42,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: genres.length,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemBuilder: (context, index) {
                  final isSelected = index == selectedGenreIndex;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGenreIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.amber : AppColors.black,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: AppColors.amber,
                          width: 1.5,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          genres[index],
                          style: TextStyle(
                            color:
                                isSelected ? AppColors.black : AppColors.amber,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: GridView.builder(
                  itemCount: exploreImages.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.65,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    return MovieCard(imagePath: exploreImages[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
