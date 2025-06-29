import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/custom_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String prefixIcon;
  final String hintText;
  final TextEditingController? controller;

  const CustomTextFormField({
    super.key,
    required this.prefixIcon,
    required this.hintText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.white,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      style: CustomTextStyles.style20w400.copyWith(
        color: AppColors.white,
        fontFamily: 'Roboto',
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: CustomTextStyles.style20w400.copyWith(
          color: AppColors.white,
          fontFamily: 'Roboto',
        ),
        fillColor: AppColors.grey,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        prefixIcon: SvgPicture.asset(
          prefixIcon,
          height: 30.h,
          width: 30.w,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
