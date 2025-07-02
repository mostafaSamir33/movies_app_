import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/UI/auth/Service/AuthService%20.dart';
import 'package:movies_app/UI/auth/widgets/customTextFormField.dart';
import 'package:movies_app/UI/widgets/custom_elevated_button_filled.dart';
import 'package:movies_app/core/utils/app_assets.dart';

class ResetPassword extends StatelessWidget {
  static const String routeName = '/Forgetpassword';
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  final AuthService _authService = AuthService();
  final formkey = GlobalKey<FormState>();

  ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back)),
        title: Text(
          'reset Password',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.r),
        child: Form(
          key: formkey,
          child: ListView(
            children: [
              Image(
                image: AssetImage(AppAssets.forgetPassword),
                fit: BoxFit.cover,
              ),
              Customtextformfield(
                hintText: 'old password',
                password: true,
                prefixIconPath: AppAssets.passwordIcon,
                controller: oldPasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Password is required';
                  if (value.length < 6)
                    return 'Password must be at least 6 characters';
                  return null;
                },
              ),
              Customtextformfield(
                hintText: 'new password',
                password: true,
                prefixIconPath: AppAssets.passwordIcon,
                controller: newPasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Password is required';
                  if (value.length < 6)
                    return 'Password must be at least 6 characters';
                  return null;
                },
              ),
              CustomElevatedButtonFilled(
                buttonText: 'change password',
                onPressed: () {
                  formkey.currentState!.validate();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
