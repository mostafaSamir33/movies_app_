import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/providers/avatar_bottom_sheet_provider.dart';
import '../../core/utils/app_colors.dart';

class AvatarBottomSheetIcon extends StatefulWidget {
  final String avatarImage;
  final int index;

  const AvatarBottomSheetIcon({
    super.key,
    required this.avatarImage,
    required this.index,
  });

  @override
  State<AvatarBottomSheetIcon> createState() => _AvatarBottomSheetIconState();
}

class _AvatarBottomSheetIconState extends State<AvatarBottomSheetIcon> {
  @override
  void initState() {
    super.initState();
    context.read<AvatarBottomSheetProvider>().initialAvatar();
  }

  @override
  Widget build(BuildContext context) {
    int? selectedIndex =
        context.watch<AvatarBottomSheetProvider>().selectedIndex;
    bool isSelected = selectedIndex == widget.index;

    return GestureDetector(
      onTap: () {
        context.read<AvatarBottomSheetProvider>().selectAvatar(widget.index);
        Navigator.of(context).pop();
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.yellow),
          borderRadius: BorderRadius.circular(20),
          color: isSelected ? AppColors.yellow.withValues(alpha: 0.56) : null,
        ),
        child: Image.asset(widget.avatarImage),
      ),
    );
  }
}
