import 'package:flutter/material.dart';
import 'package:movies_app/UI/auth/widgets/customTextFormField.dart';
import 'package:movies_app/UI/widgets/custom_elevated_button_filled.dart';
import 'package:movies_app/core/utils/app_assets.dart';

class Forgetpassword extends StatelessWidget {
  static const String routeName = '/Forgetpassword';
  TextEditingController forgetPasswordController = TextEditingController();

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
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
            ),
            CustomElevatedButtonFilled(
              buttonText: 'Verify Email',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
