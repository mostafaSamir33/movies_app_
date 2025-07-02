import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movies_app/UI/main_layer/tabs/profileTab/widgets/profile_tab_body.dart';
import 'package:movies_app/UI/main_layer/tabs/profileTab/widgets/profile_tab_header.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/custom_text_styles.dart';
import 'models/profile_response_model.dart';
import 'network/profile_api.dart';

class ProfileTabScreen extends StatefulWidget {
  const ProfileTabScreen({super.key});

  @override
  State<ProfileTabScreen> createState() => _ProfileTabScreenState();
}

class _ProfileTabScreenState extends State<ProfileTabScreen>
    with TickerProviderStateMixin {
  late Future<ProfileData?> _profileFuture;

  @override
  void initState() {
    super.initState();
    _profileFuture = ProfileApi.getProfile(context);
  }

  void _reloadProfile() {
    setState(() {
      _profileFuture = ProfileApi.getProfile(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    TabController controller = TabController(
        length: 2, vsync: this, animationDuration: Duration(seconds: 1));
    return Scaffold(
      body: FutureBuilder<ProfileData?>(
        future: ProfileApi.getProfile(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.yellow,
              ),
            );
          }
          if (snapshot.hasError) {
            log(snapshot.error.toString());
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: CustomTextStyles.style20w600
                    .copyWith(color: AppColors.yellow),
              ),
            );
          }
          ProfileData? profileData = snapshot.data;
          return Column(
            children: [
              ProfileTabHeader(
                controller: controller,
                profileData: profileData,
                onProfileUpdated: _reloadProfile,
              ),
              Expanded(
                child: ProfileTabBody(
                  controller: controller,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
