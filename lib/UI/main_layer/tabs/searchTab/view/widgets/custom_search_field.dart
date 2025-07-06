import 'package:flutter/material.dart';
import 'package:movies_app/core/extentions/context_extention.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class CustomSearchField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String) onChanged;

  const CustomSearchField({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          ImageIcon(
            AssetImage(AppAssets.searchIcon),
            color: AppColors.white,
            size: 24,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              cursorColor: AppColors.white,
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              style: const TextStyle(color: AppColors.white),
              decoration: InputDecoration(
                hintText: context.getLocalization().search,
                hintStyle: const TextStyle(color: AppColors.white),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
