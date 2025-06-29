import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/UI/auth/screens/signInScreen.dart';
import 'package:movies_app/UI/auth/widgets/customSwitch.dart';
import 'package:movies_app/UI/auth/widgets/customTextFormField.dart';
import 'package:movies_app/UI/widgets/custom_elevated_button_filled.dart';
import 'package:movies_app/core/models/profile_images_model.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/custom_text_styles.dart';

class Signupscreen extends StatelessWidget {
  static const String routeName = '/Signupscreen';

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back,
              size: 24.r,
            )),
        title: Text(
          'Register',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.r),
        child: ListView(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 161.h,
                viewportFraction: 0.4,
                initialPage: 3,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: false,
                enlargeCenterPage: true,
                enlargeFactor: 0.4,
                scrollDirection: Axis.horizontal,
              ),
              items: List.generate(
                      ProfileImagesModel.profiles.length, (index) => index)
                  .map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Image(
                        image:
                            AssetImage(ProfileImagesModel.profiles[i].image));
                  },
                );
              }).toList(),
            ),
            Align(
              alignment: Alignment(0, 0),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.r),
                child: Text(
                  'Avatar',
                  style: CustomTextStyles.style20w400
                      .copyWith(color: AppColors.white),
                ),
              ),
            ),
            Customtextformfield(
              hintText: 'Name',
              password: false,
              prefixIconPath: AppAssets.idIcon,
              controller: nameController,
            ),
            Customtextformfield(
              hintText: 'Email',
              password: false,
              prefixIconPath: AppAssets.emailIcon,
              controller: emailController,
            ),
            Customtextformfield(
              hintText: 'Password',
              password: true,
              prefixIconPath: AppAssets.passwordIcon,
              controller: passwordController,
            ),
            Customtextformfield(
              hintText: 'Confirm Password',
              password: true,
              prefixIconPath: AppAssets.passwordIcon,
              controller: confirmPasswordController,
            ),
            Customtextformfield(
              hintText: 'Phone Number',
              password: false,
              prefixIconPath: AppAssets.phoneIcon1,
              controller: phoneController,
            ),
            CustomElevatedButtonFilled(
              buttonText: 'Create Account',
              onPressed: () => Navigator.of(context).pop(),
            ),
            SizedBox(
              height: 18.h,
            ),
            Align(
              alignment: Alignment(0, 0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Already Have Account ? ',
                    ),
                    TextSpan(
                      style: CustomTextStyles.style14w400.copyWith(
                          color: AppColors.yellow, fontWeight: FontWeight.bold),
                      text: 'Login',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 18.h,
            ),
            Customswitch(
              inactiveIcon: AppAssets.enIcon,
              activeIcon: AppAssets.egIcon,
            ),
          ],
        ),
      ),
    );
  }
}
