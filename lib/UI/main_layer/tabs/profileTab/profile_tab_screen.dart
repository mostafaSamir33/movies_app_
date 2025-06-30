import 'package:flutter/material.dart';
import 'package:movies_app/UI/main_layer/tabs/profileTab/widgets/profile_tab_body.dart';
import 'package:movies_app/UI/main_layer/tabs/profileTab/widgets/profile_tab_header.dart';

class ProfileTabScreen extends StatefulWidget {
  const ProfileTabScreen({super.key});

  @override
  State<ProfileTabScreen> createState() => _ProfileTabScreenState();
}

class _ProfileTabScreenState extends State<ProfileTabScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController controller = TabController(
        length: 2, vsync: this, animationDuration: Duration(seconds: 1));
    return Scaffold(
      body: Column(
        children: [
          ProfileTabHeader(
            controller: controller,
          ),
          Expanded(
            child: ProfileTabBody(
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}
