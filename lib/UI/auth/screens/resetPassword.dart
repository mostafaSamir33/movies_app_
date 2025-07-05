import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/UI/auth/Service/AuthService%20.dart';
import 'package:movies_app/UI/auth/widgets/customTextFormField.dart';
import 'package:movies_app/UI/widgets/custom_elevated_button_filled.dart';
import 'package:movies_app/core/extentions/context_extention.dart';
import 'package:movies_app/core/utils/app_assets.dart';

class ResetPassword extends StatelessWidget {
  static const String routeName = '/Forgetpassword';
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  final AuthService _authService = AuthService();
  final formKey = GlobalKey<FormState>();

  ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back)),
        title: Text(
          context.getLocalization().resetPassword,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.r),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Image(
                image: AssetImage(AppAssets.forgetPassword),
                fit: BoxFit.cover,
              ),
              CustomTextFormFieldAuth(
                hintText: context.getLocalization().oldPasswordHint,
                password: true,
                prefixIconPath: AppAssets.passwordIcon,
                controller: oldPasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.getLocalization().passwordRequired;
                  }
                  if (value.length < 6) {
                    return context.getLocalization().passwordMinLength;
                  }
                  if (!RegExp(r'[A-Z]').hasMatch(value)) {
                    return context.getLocalization().passwordUppercase;
                  }
                  if (!RegExp(r'[0-9]').hasMatch(value)) {
                    return context.getLocalization().passwordNumber;
                  }
                  if (!RegExp(r'[!@#\$&*~%^()\-_+=<>?/.,;:{}\[\]]')
                      .hasMatch(value)) {
                    return context.getLocalization().passwordSpecial;
                  }
                  return null;
                },
              ),
              CustomTextFormFieldAuth(
                hintText: context.getLocalization().newPasswordHint,
                password: true,
                prefixIconPath: AppAssets.passwordIcon,
                controller: newPasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.getLocalization().passwordRequired;
                  }
                  if (value.length < 6) {
                    return context.getLocalization().passwordMinLength;
                  }
                  if (!RegExp(r'[A-Z]').hasMatch(value)) {
                    return context.getLocalization().passwordUppercase;
                  }
                  if (!RegExp(r'[0-9]').hasMatch(value)) {
                    return context.getLocalization().passwordNumber;
                  }
                  if (!RegExp(r'[!@#\$&*~%^()\-_+=<>?/.,;:{}\[\]]')
                      .hasMatch(value)) {
                    return context.getLocalization().passwordSpecial;
                  }
                  return null;
                },
              ),
              CustomElevatedButtonFilled(
                buttonText: context.getLocalization().changePassword,
                onPressed: () {
                  formKey.currentState!.validate();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
