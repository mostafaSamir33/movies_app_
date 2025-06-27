import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_assets.dart';

class ProfileImagesModel {
  final String image;
  ProfileImagesModel({required this.image});

  static List<ProfileImagesModel> profiles = [
    ProfileImagesModel(image: AppAssets.profile1),
    ProfileImagesModel(image: AppAssets.profile2),
    ProfileImagesModel(image: AppAssets.profile3),
    ProfileImagesModel(image: AppAssets.profile4),
    ProfileImagesModel(image: AppAssets.profile5),
    ProfileImagesModel(image: AppAssets.profile6),
    ProfileImagesModel(image: AppAssets.profile7),
    ProfileImagesModel(image: AppAssets.profile8),
    ProfileImagesModel(image: AppAssets.profile9),
  ];
}
