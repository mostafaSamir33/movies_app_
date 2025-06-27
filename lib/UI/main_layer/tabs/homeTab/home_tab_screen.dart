import 'package:flutter/material.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/widgets/action_movies_section.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/widgets/available_now_section.dart';


class HomeTabScreen extends StatelessWidget {
  const HomeTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: const [
            AvailableNowSection(),
            SizedBox(height: 32),
            ActionMoviesSection(),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
