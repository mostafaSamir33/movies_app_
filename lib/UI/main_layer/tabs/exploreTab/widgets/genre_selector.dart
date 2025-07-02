import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/custom_text_styles.dart';

class GenreSelector extends StatelessWidget {
  final List<String> genres;
  final int selectedIndex;
  final void Function(int) onGenreSelected;

  const GenreSelector({
    super.key,
    required this.genres,
    required this.selectedIndex,
    required this.onGenreSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: genres.length,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () => onGenreSelected(index),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 6),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.amber : AppColors.black1,
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
                    color: isSelected ? AppColors.black1 : AppColors.amber,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
