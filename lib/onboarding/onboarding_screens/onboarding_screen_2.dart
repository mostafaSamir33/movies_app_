import 'package:flutter/material.dart';
import 'package:movies_app/onboarding/pageview_pages/page4.dart';
import 'package:movies_app/onboarding/pageview_pages/page5.dart';

import '../pageview_pages/page1.dart';
import '../pageview_pages/page2.dart';
import '../pageview_pages/page3.dart';

class OnboardingScreen2 extends StatefulWidget {
  static const String routeName = '/onboardingScreen2';

  const OnboardingScreen2({super.key});

  @override
  State<OnboardingScreen2> createState() => _OnboardingScreen2State();
}

class _OnboardingScreen2State extends State<OnboardingScreen2> {
  PageController controller = PageController();
  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      Page1(controller: controller),
      Page2(controller: controller),
      Page3(controller: controller),
      Page4(controller: controller),
      Page5(controller: controller),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemBuilder: (context, index) => pages[index],
        itemCount: pages.length,
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
      ),
    );
  }
}
