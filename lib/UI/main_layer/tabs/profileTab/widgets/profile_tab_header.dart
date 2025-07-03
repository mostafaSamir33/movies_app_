import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/UI/auth/screens/signInScreen.dart';
import 'package:movies_app/core/providers/token_provider.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/custom_text_styles.dart';
import 'package:provider/provider.dart';

import '../../../../../core/models/avatar_bottom_sheet_model.dart';
import '../models/profile_response_model.dart';
import '../screens/update_profile_screen.dart';

class ProfileTabHeader extends StatefulWidget {
  final TabController controller;
  final ProfileData? profileData;
  final VoidCallback onProfileUpdated;

  const ProfileTabHeader(
      {super.key,
      required this.controller,
      required this.profileData,
      required this.onProfileUpdated});

  @override
  State<ProfileTabHeader> createState() => _ProfileTabHeaderState();
}

class _ProfileTabHeaderState extends State<ProfileTabHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.black2),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 14.r, left: 24, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AvatarBottomSheetModel
                            .avatarImages[widget.profileData?.avaterId ?? 7]
                            .avatarImage,
                        height: 118.h,
                        width: 118.w,
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      SizedBox(
                        width: 118.w,
                        child: Text(
                          widget.profileData?.name != null
                              ? (widget.profileData?.name)!
                                  .split(' ')
                                  .take(2)
                                  .join(' ')
                                  .substring(0)
                                  .toUpperCase()
                              : 'User Name',
                          style: CustomTextStyles.style20w700.copyWith(
                              color: AppColors.white, fontFamily: 'Roboto'),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '12', //TODO: change to the exactly number
                        style: CustomTextStyles.style36w500.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                            fontFamily: 'Roboto'),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'Wish List', //TODO:localization
                        style: CustomTextStyles.style24w700.copyWith(
                            color: AppColors.white, fontFamily: 'Roboto'),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '10', //TODO: change to the exactly number
                        style: CustomTextStyles.style36w500.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                            fontFamily: 'Roboto'),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'History', //TODO:localization
                        style: CustomTextStyles.style24w700.copyWith(
                            color: AppColors.white, fontFamily: 'Roboto'),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r)
                  .copyWith(top: 22.r, bottom: 30.r),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: FilledButton(
                      onPressed: () async {
                        log(context.read<TokenProvider>().token.toString());
                        final updated = await Navigator.of(context).pushNamed(
                            UpdateProfileScreen.routeName,
                            arguments: widget.profileData);

                        if (updated == true) {
                          widget.onProfileUpdated();
                        }
                      },
                      style: FilledButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14)),
                          minimumSize: Size(252.w, 56.h),
                          backgroundColor: AppColors.yellow),
                      child: Text(
                        'Edit Profile', //TODO:localization
                        style: CustomTextStyles.style20w400.copyWith(
                            color: AppColors.black1, fontFamily: 'Roboto'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    flex: 3,
                    child: FilledButton(
                      onPressed: () {
                        context.read<TokenProvider>().token = null;
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          SignInScreen.routeName,
                          (route) => false,
                        );
                      },
                      style: FilledButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14)),
                          minimumSize: Size(134.w, 56.h),
                          backgroundColor: AppColors.red),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Exit', //TODO:localization
                            style: CustomTextStyles.style20w400.copyWith(
                                color: AppColors.white, fontFamily: 'Roboto'),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          SvgPicture.asset(
                            AppAssets.exitIcon,
                            height: 18.h,
                            width: 16.4.w,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            TabBar(
              controller: widget.controller,
              indicatorWeight: 3.r,
              indicatorColor: AppColors.yellow,
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              labelStyle: CustomTextStyles.style20w400
                  .copyWith(color: AppColors.white, fontFamily: 'Roboto'),
              unselectedLabelStyle: CustomTextStyles.style20w400
                  .copyWith(color: AppColors.white, fontFamily: 'Roboto'),
              tabs: [
                Padding(
                  padding: EdgeInsets.only(bottom: 6.r),
                  child: Tab(
                    text: 'Watch List', //TODO:localization
                    iconMargin: EdgeInsets.only(bottom: 12.r),
                    icon: SvgPicture.asset(
                      AppAssets.watchListIcon,
                      height: 24.h,
                      width: 38.w,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 6.r),
                  child: Tab(
                    text: 'History', //TODO:localization
                    iconMargin: EdgeInsets.only(bottom: 12.r),
                    icon: SvgPicture.asset(
                      AppAssets.historyIcon,
                      height: 30.h,
                      width: 36.w,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
