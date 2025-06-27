import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/UI/main_layer/tabs/exploreTab/explore_tab_screen.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/home_tab_screen.dart';
import 'package:movies_app/UI/main_layer/tabs/profileTab/profile_tab_screen.dart';
import 'package:movies_app/UI/main_layer/tabs/searchTab/search_tab_screen.dart';

class MainLayerScreen extends StatefulWidget {
  static const String routeName = '/mainLayerScreen';
  const MainLayerScreen({super.key});

  @override
  State<MainLayerScreen> createState() => _MainLayerScreenState();
}

class _MainLayerScreenState extends State<MainLayerScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.grey,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BottomNavigationBar(
            onTap: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.homeIcon)),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.searchIcon)),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.exploreIcon)),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.profileIcon)),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          const HomeTabScreen(),
          const SearchTabScreen(),
          const ExploreTabScreen(),
          const ProfileTabScreen(),
        ],
      ),
    );
  }
}
