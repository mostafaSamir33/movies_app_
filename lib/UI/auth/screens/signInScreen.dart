import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/UI/auth/Service/AuthService%20.dart';
import 'package:movies_app/UI/auth/screens/signUpScreen.dart';
import 'package:movies_app/UI/auth/widgets/customSwitch.dart';
import 'package:movies_app/UI/auth/widgets/customTextFormField.dart';
import 'package:movies_app/UI/main_layer/main_layer_screen.dart';
import 'package:movies_app/UI/widgets/custom_elevated_button_filled.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/custom_text_styles.dart';

import '../Service/googleServices.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = '/Signinscreen';

  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final AuthService _authService = AuthService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.r),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(height: 28.h),
                Image(
                  image: AssetImage(AppAssets.signinLogo),
                  width: 121.w,
                  height: 118.h,
                ),
                SizedBox(height: 69.h),
                CustomTextFormFieldAuth(
                  hintText: 'Email',
                  password: false,
                  prefixIconPath: AppAssets.emailIcon,
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                        .hasMatch(value)) {
                      return 'Enter valid email';
                    }
                    return null;
                  },
                ),
                CustomTextFormFieldAuth(
                  hintText: 'Password',
                  password: true,
                  prefixIconPath: AppAssets.passwordIcon,
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forget Password ?',
                    style: CustomTextStyles.style14w400.copyWith(
                      color: AppColors.yellow,
                    ),
                  ),
                ),
                SizedBox(height: 34.h),
                CustomElevatedButtonFilled(
                  buttonText: 'Login',
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      loginUser(context, emailController.text,
                          passwordController.text);
                    }
                  },
                ),
                SizedBox(height: 23.h),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: 'Don’t Have Account ? '),
                      TextSpan(
                        style: CustomTextStyles.style14w400.copyWith(
                          color: AppColors.yellow,
                          fontWeight: FontWeight.bold,
                        ),
                        text: 'Create One',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.pushNamed(
                                context,
                                Signupscreen.routeName,
                              ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 27.h),
                Row(
                  children: [
                    Expanded(child: Divider(indent: 75.r)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.r),
                      child: Text(
                        'OR',
                        style: CustomTextStyles.style16w400.copyWith(
                          color: AppColors.yellow,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(endIndent: 75.r)),
                  ],
                ),
                SizedBox(height: 28.h),
                CustomElevatedButtonFilled(
                  isSingInPage: true,
                  buttonText: 'Login With Google',
                  onPressed: () {
                    googleSignIn();
                  },
                ),
                SizedBox(height: 33.h),
                CustomSwitch(
                  inactiveIcon: AppAssets.enIcon,
                  activeIcon: AppAssets.egIcon,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loginUser(BuildContext context, String email, String password) async {
    try {
      final response = await _authService.login(email, password, context);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Login Successful',
          style: CustomTextStyles.style20w600.copyWith(color: AppColors.black1),
        ),
        backgroundColor: AppColors.yellow,
      ));
      Navigator.pushReplacementNamed(context, MainLayerScreen.routeName);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Error: $e',
          style: CustomTextStyles.style20w600.copyWith(color: AppColors.white),
        ),
        backgroundColor: AppColors.red,
      ));
    }
  }

  googleSignIn() async {
    final user = await GoogleServices.login();
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Login failed',
          style: CustomTextStyles.style20w600.copyWith(color: AppColors.white),
        ),
        backgroundColor: AppColors.red,
      ));
    } else {
      Navigator.pushReplacementNamed(
        context,
        MainLayerScreen.routeName,
      );
    }
  }
}
