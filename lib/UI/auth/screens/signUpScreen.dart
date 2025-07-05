import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/UI/auth/Service/AuthService .dart';
import 'package:movies_app/UI/auth/cubit/auth_cubit.dart';
import 'package:movies_app/UI/auth/cubit/auth_state.dart';
import 'package:movies_app/UI/auth/widgets/customSwitch.dart';
import 'package:movies_app/UI/auth/widgets/customTextFormField.dart';
import 'package:movies_app/UI/widgets/custom_elevated_button_filled.dart';
import 'package:movies_app/core/models/avatar_bottom_sheet_model.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/custom_text_styles.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/Signupscreen';

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();

  int selectedIndex = 7;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(AuthService()),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(Icons.arrow_back, size: 24.r)),
          title: Text('Register'),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      selectedIndex = index;
                    },
                    height: 161.h,
                    viewportFraction: 0.4,
                    initialPage: selectedIndex,
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.4,
                  ),
                  items: List.generate(
                    AvatarBottomSheetModel.avatarImages.length,
                    (index) => index,
                  ).map((i) {
                    return Builder(
                      builder: (context) {
                        return Image(
                          image: AssetImage(
                            AvatarBottomSheetModel.avatarImages[i].avatarImage,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                Align(
                  alignment: Alignment.center,
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
                  validator: (value) => value == null || value.isEmpty
                      ? 'Name is required'
                      : null,
                ),
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
                    if (!RegExp(r'[A-Z]').hasMatch(value)) {
                      return 'Password must contain at least one uppercase letter';
                    }
                    if (!RegExp(r'[0-9]').hasMatch(value)) {
                      return 'Password must contain at least one number';
                    }
                    if (!RegExp(r'[!@#\$&*~%^()\-_+=<>?/.,;:{}\[\]]')
                        .hasMatch(value)) {
                      return 'Password must contain at least one special character';
                    }
                    return null;
                  },
                ),
                CustomTextFormFieldAuth(
                  hintText: 'Confirm Password',
                  password: true,
                  prefixIconPath: AppAssets.passwordIcon,
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Confirm your password';
                    }
                    if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                CustomTextFormFieldAuth(
                  hintText: 'Phone Number',
                  password: false,
                  prefixIconPath: AppAssets.phoneIcon1,
                  controller: phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone number is required';
                    }
                    if (!value.startsWith('+')) {
                      return 'Phone number must start with +';
                    }
                    if (value.length != 13) {
                      return 'Phone number must be exactly 12 characters';
                    }
                    if (!RegExp(r'^\+\d{12}$').hasMatch(value)) {
                      return 'Phone number must contain only digits after +';
                    }
                    return null;
                  },
                ),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthLoading) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) =>
                            Center(child: CircularProgressIndicator()),
                      );
                    } else {
                      Navigator.pop(context);
                    }

                    if (state is AuthSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(state.message),
                        backgroundColor: AppColors.yellow,
                      ));
                      Navigator.pop(context);
                    } else if (state is AuthFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(state.message),
                        backgroundColor: AppColors.red,
                      ));
                    }
                  },
                  builder: (context, state) {
                    return CustomElevatedButtonFilled(
                      buttonText: 'Create Account',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthCubit>().register(
                                nameController.text.trim(),
                                emailController.text.trim(),
                                passwordController.text.trim(),
                                confirmPasswordController.text.trim(),
                                phoneController.text.trim(),
                                selectedIndex,
                                context,
                              );
                        }
                      },
                    );
                  },
                ),
                SizedBox(height: 18.h),
                Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: 'Already Have Account ? '),
                        TextSpan(
                          style: CustomTextStyles.style14w400.copyWith(
                            color: AppColors.yellow,
                            fontWeight: FontWeight.bold,
                          ),
                          text: 'Login',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 18.h),
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
}
