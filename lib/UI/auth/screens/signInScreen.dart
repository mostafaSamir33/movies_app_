import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/UI/auth/screens/forgetPassword.dart';
import 'package:movies_app/UI/auth/screens/signUpScreen.dart';
import 'package:movies_app/UI/auth/widgets/customSwitch.dart';
import 'package:movies_app/UI/auth/widgets/customTextFormField.dart';
import 'package:movies_app/UI/main_layer/main_layer_screen.dart';
import 'package:movies_app/UI/widgets/custom_elevated_button_filled.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/custom_text_styles.dart';

class Signinscreen extends StatefulWidget {
  static const String routeName = '/Signinscreen';

  @override
  State<Signinscreen> createState() => _SigninscreenState();
}

class _SigninscreenState extends State<Signinscreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.r),
          child: Column(
            children: [
              SizedBox(
                height: size.height * .03,
              ),
              Image(
                image: AssetImage(AppAssets.signinLogo),
                width: size.width * .28,
                height: size.height * .12,
              ),
              SizedBox(
                height: size.height * .05,
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
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, Forgetpassword.routeName),
                  child: Text(
                    'Forget Password ?',
                    style: CustomTextStyles.style14w400
                        .copyWith(color: AppColors.yellow),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .05,
              ),
              CustomElevatedButtonFilled(
                buttonText: 'Login',
                onPressed: () => Navigator.pushReplacementNamed(
                    context, MainLayerScreen.routeName),
              ),
              SizedBox(
                height: size.height * .03,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Don’t Have Account ? ',
                    ),
                    TextSpan(
                      style: CustomTextStyles.style14w400.copyWith(
                          color: AppColors.yellow, fontWeight: FontWeight.bold),
                      text: 'Create One',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.pushReplacementNamed(
                            context, Signupscreen.routeName),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * .03,
              ),
              Row(
                children: [
                  Expanded(
                      child: Divider(
                    indent: 75,
                  )),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.r),
                    child: Text(
                      'OR',
                      style: CustomTextStyles.style16w400
                          .copyWith(color: AppColors.yellow),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      endIndent: 75,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * .03,
              ),
              CustomElevatedButtonFilled(
                isSinginPage: true,
                buttonText: 'Login With Google',
                onPressed: () {},
              ),
              SizedBox(
                height: size.height * .03,
              ),
              Customswitch(
                inactiveIcon: AppAssets.enIcon,
                activeIcon: AppAssets.egIcon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
