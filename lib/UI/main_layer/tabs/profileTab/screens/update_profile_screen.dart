import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/UI/main_layer/tabs/profileTab/models/profile_response_model.dart';
import 'package:movies_app/UI/widgets/avatar_bottom_sheet_icon.dart';
import 'package:movies_app/core/models/avatar_bottom_sheet_model.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/custom_text_styles.dart';
import 'package:provider/provider.dart';

import '../../../../../core/providers/avatar_bottom_sheet_provider.dart';
import '../../../../widgets/custom_elevated_button_filled.dart';
import '../../../../widgets/custom_text_form_field.dart';

class UpdateProfileScreen extends StatefulWidget {
  static const String routeName = '/updateProfileScreen';

  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    ProfileData profileData =
        ModalRoute.of(context)!.settings.arguments as ProfileData;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back_rounded, color: AppColors.yellow),
        ),
        title: Text(
          'Pick Avatar', //TODO:localization
          style: CustomTextStyles.style16w400.copyWith(
            color: AppColors.yellow,
            fontFamily: 'Roboto',
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 16.r,
          right: 16.r,
          bottom: 34.r,
          top: 36.r,
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  transitionAnimationController: AnimationController(
                    vsync: this,
                    duration: Duration(seconds: 1),
                    reverseDuration: Duration(seconds: 1),
                  ),
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  context: context,
                  builder: (context) {
                    return TapRegion(
                      onTapOutside: (event) => Navigator.of(context).pop(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.all(18),
                            margin: EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: AppColors.grey,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 18,
                                mainAxisSpacing: 18,
                                childAspectRatio: 108 / 105,
                              ),
                              itemBuilder: (context, index) {
                                return AvatarBottomSheetIcon(
                                  avatarImage: AvatarBottomSheetModel
                                      .avatarImages[index].avatarImage,
                                  index: index,
                                );
                              },
                              itemCount:
                                  AvatarBottomSheetModel.avatarImages.length,
                              shrinkWrap: true,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Image.asset(
                context.watch<AvatarBottomSheetProvider>().selectedAvatar ??
                    AppAssets.avatarImage8,
                height: 150.h,
                width: 150.w,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 34.r, bottom: 20.r),
              child: CustomTextFormFieldOnboarding(
                hintText: 'Name', //TODO:localization
                prefixIcon: AppAssets.personIcon,
                controller: TextEditingController(text: profileData.name ?? ''),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30.r),
              child: CustomTextFormFieldOnboarding(
                hintText: 'Phone Number', //TODO:localization
                prefixIcon: AppAssets.phoneIcon1,
                controller:
                    TextEditingController(text: profileData.phone ?? ''),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  'Reset Password', //TODO:localization
                  style: CustomTextStyles.style20w400.copyWith(
                    color: AppColors.white,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: CustomElevatedButtonFilled(
                onPressed: () {},
                buttonColor: AppColors.red,
                buttonTextWidget: Text(
                  'Delete Account', //TODO:localization
                  style: CustomTextStyles.style20w400.copyWith(
                    color: AppColors.white,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
            ),
            CustomElevatedButtonFilled(
              onPressed: () {},
              buttonTextWidget: Text(
                'Update Data', //TODO:localization
                style: CustomTextStyles.style20w400.copyWith(
                  color: AppColors.black1,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
