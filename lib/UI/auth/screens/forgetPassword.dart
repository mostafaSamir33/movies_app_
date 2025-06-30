import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/UI/auth/Service/AuthService%20.dart';
import 'package:movies_app/UI/auth/widgets/customTextFormField.dart';
import 'package:movies_app/UI/widgets/custom_elevated_button_filled.dart';
import 'package:movies_app/core/utils/app_assets.dart';

class Forgetpassword extends StatelessWidget {
  static const String routeName = '/Forgetpassword';
  TextEditingController forgetPasswordController = TextEditingController();
  final AuthService _authService = AuthService();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back)),
        title: Text(
          'Forget Password',
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
                hintText: 'Email',
                password: false,
                prefixIconPath: AppAssets.emailIcon,
                controller: forgetPasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Email is required';
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                      .hasMatch(value)) return 'Enter valid email';
                  return null;
                },
              ),
              CustomElevatedButtonFilled(
                buttonText: 'Verify Email',
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    resetPassword(
                      context,
                      forgetPasswordController.text,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void resetPassword(BuildContext context, String email) async {
    try {
      final response = await _authService.forgetPassword(email);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Check your email for reset link')));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }
}
