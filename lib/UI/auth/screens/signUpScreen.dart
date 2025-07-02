import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/UI/auth/Service/AuthService%20.dart';
import 'package:movies_app/UI/auth/widgets/customSwitch.dart';
import 'package:movies_app/UI/auth/widgets/customTextFormField.dart';
import 'package:movies_app/UI/widgets/custom_elevated_button_filled.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/custom_text_styles.dart';

import '../../../core/models/avatar_bottom_sheet_model.dart';

class Signupscreen extends StatefulWidget {
  static const String routeName = '/Signupscreen';

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  final AuthService _authService = AuthService();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    var selectedIndex = 3;
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
        child: Form(
          key: formkey,
          child: ListView(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    selectedIndex = index;
                    print(selectedIndex);
                  },
                  height: 161.h,
                  viewportFraction: 0.4,
                  initialPage: 7,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: false,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.4,
                  scrollDirection: Axis.horizontal,
                ),
                items: List.generate(AvatarBottomSheetModel.avatarImages.length,
                    (index) => index).map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Image(
                          image: AssetImage(AvatarBottomSheetModel
                              .avatarImages[i].avatarImage));
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
              CustomTextFormFieldAuth(
                hintText: 'Name',
                password: false,
                prefixIconPath: AppAssets.idIcon,
                controller: nameController,
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Name is required'
                    : null,
              ),
              CustomTextFormFieldAuth(
                hintText: 'Email',
                password: false,
                prefixIconPath: AppAssets.emailIcon,
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Email is required';
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                      .hasMatch(value)) return 'Enter valid email';
                  return null;
                },
              ),
              CustomTextFormFieldAuth(
                hintText: 'Password',
                password: true,
                prefixIconPath: AppAssets.passwordIcon,
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Password is required';
                  if (value.length < 6)
                    return 'Password must be at least 6 characters';
                  return null;
                },
              ),
              CustomTextFormFieldAuth(
                hintText: 'Confirm Password',
                password: true,
                prefixIconPath: AppAssets.passwordIcon,
                controller: confirmPasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Confirm your password';
                  if (value != passwordController.text)
                    return 'Passwords do not match';
                  return null;
                },
              ),
              CustomTextFormFieldAuth(
                hintText: 'Phone Number',
                password: false,
                prefixIconPath: AppAssets.phoneIcon1,
                controller: phoneController,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Phone number is required';
                  return null;
                },
              ),
              CustomElevatedButtonFilled(
                buttonText: 'Create Account',
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    registerUser(
                        context,
                        nameController.text.trim(),
                        emailController.text.trim(),
                        passwordController.text.trim(),
                        confirmPasswordController.text.trim(),
                        phoneController.text.trim(),
                        selectedIndex);
                  }
                },
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
                            color: AppColors.yellow,
                            fontWeight: FontWeight.bold),
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
              CustomSwitch(
                inactiveIcon: AppAssets.enIcon,
                activeIcon: AppAssets.egIcon,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void registerUser(
      BuildContext context,
      String name,
      String email,
      String password,
      String confirmPassword,
      String phone,
      int avatarId) async {
    try {
      final response = await _authService.register(
        context,
        name,
        email,
        password,
        confirmPassword,
        phone,
        avatarId,
      );

      if (response['message'] != null &&
          response['message'].toString().toLowerCase().contains('success')) {
        print('xxxxxxxx');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration Successful')),
        );

        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response['message'] ?? 'Registration failed')),
        );
        print('-------------');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
      print(e);
    }
  }
}
