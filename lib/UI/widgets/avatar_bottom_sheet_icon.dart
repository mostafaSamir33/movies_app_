import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main_layer/tabs/profileTab/providers/avatar_bottom_sheet_provider.dart';
import '../../core/utils/app_colors.dart';

class AvatarBottomSheetIcon extends StatelessWidget {
  final String avatarImage;
  final int index;

  const AvatarBottomSheetIcon({
    super.key,
    required this.avatarImage,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    int? selectedIndex =
        context.watch<AvatarBottomSheetProvider>().selectedIndex;
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        context.read<AvatarBottomSheetProvider>().selectAvatar(index);
        Navigator.of(context).pop();
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.yellow),
          borderRadius: BorderRadius.circular(20),
          color: isSelected ? AppColors.yellow.withValues(alpha: 0.56) : null,
        ),
        child: Image.asset(avatarImage),
      ),
    );
  }
}
