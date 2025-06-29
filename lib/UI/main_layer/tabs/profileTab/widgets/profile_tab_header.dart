import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/UI/screens/update_profile_screen.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/custom_text_styles.dart';

class ProfileTabHeader extends StatelessWidget {
  final TabController controller;

  const ProfileTabHeader({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.black2),
      child: SafeArea(
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
                        AppAssets.avatarImage8,
                        height: 118.h,
                        width: 118.w,
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      Text(
                        'John Safwat', //TODO:change to user name
                        style: CustomTextStyles.style20w700.copyWith(
                            color: AppColors.white, fontFamily: 'Roboto'),
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
                  .copyWith(top: 22.r, bottom: 20.r),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: FilledButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(UpdateProfileScreen.routeName);
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
                      onPressed: () {},
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
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            TabBar(
              controller: controller,
              indicatorWeight: 3,
              indicatorColor: AppColors.yellow,
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              tabs: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppAssets.watchListIcon,
                      height: 16.h,
                      width: 30.w,
                    ),
                    SizedBox(
                      height: 10.4.h,
                    ),
                    Text(
                      'Watch List', //TODO:localization
                      style: CustomTextStyles.style20w400.copyWith(
                          color: AppColors.white, fontFamily: 'Roboto'),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppAssets.historyIcon,
                      height: 42.h,
                      width: 42.w,
                    ),
                    // SizedBox(
                    //   height: 10.4.h,
                    // ),
                    Text(
                      'History', //TODO:localization
                      style: CustomTextStyles.style20w400.copyWith(
                          color: AppColors.white, fontFamily: 'Roboto'),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
