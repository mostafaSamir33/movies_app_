import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/UI/main_layer/tabs/profileTab/providers/profile_tab_provider.dart';
import 'package:movies_app/UI/main_layer/tabs/profileTab/widgets/profile_tab_body/profile_tab_body.dart';
import 'package:movies_app/UI/main_layer/tabs/profileTab/widgets/profile_tab_header/profile_tab_header.dart';
import 'package:movies_app/core/extentions/context_extention.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/custom_text_styles.dart';
import '../../../../main.dart';
import '../../../movieDetails/model/movie_details_model.dart';
import 'models/get_favourite_movies_response_model.dart';
import 'models/profile_response_model.dart';

class ProfileTabScreen extends StatefulWidget {
  const ProfileTabScreen({super.key});

  @override
  State<ProfileTabScreen> createState() => _ProfileTabScreenState();
}

class _ProfileTabScreenState extends State<ProfileTabScreen>
    with TickerProviderStateMixin, RouteAware {
  late TabController controller = TabController(
      length: 2, vsync: this, animationDuration: Duration(seconds: 1));

  ProfileData? getProfileData;
  List<FavouriteMovie>? getWatchListMovies;
  List<MovieDetails>? getHistoryMovies;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => context.read<ProfileTabProvider>().initialize(context));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    controller.dispose();
    super.dispose();
  }

  @override
  void didPopNext() {
    context.read<ProfileTabProvider>().initialize(context);
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProfileTabProvider>();
    return Scaffold(
      body: provider.loading
          ? Center(
              child: CircularProgressIndicator(
                color: AppColors.yellow,
              ),
            )
          : provider.errorMessage != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        provider.errorMessage!,
                        style: CustomTextStyles.style20w600
                            .copyWith(color: AppColors.yellow),
                      ),
                    ],
                  ),
                )
              : NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    SliverToBoxAdapter(
                      child: ProfileTabHeader(
                        controller: controller,
                        profileData: provider.profileData,
                      ),
                    ),
                    SliverPersistentHeader(
                      delegate: _TabBarDelegate(controller),
                      pinned: true,
                    ),
                  ],
                  body: ProfileTabBody(
                      controller: controller,
                      allWatchedMovies: provider.watchedMovies,
                      favouriteMovies: provider.favouriteMovies),
                ),
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabController controller;

  _TabBarDelegate(this.controller);

  static final double _barHeight = 130.h;

  static final double _gap = 3.h;
  final double _safeInset = WidgetsBinding.instance.window.padding.top /
      WidgetsBinding.instance.window.devicePixelRatio;

  @override
  double get minExtent => _barHeight;

  @override
  double get maxExtent => _barHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double topLift = (_safeInset - shrinkOffset).clamp(0.0, _safeInset);
    final bool isPinned = shrinkOffset >= _safeInset;

    return Container(
      decoration: isPinned
          ? BoxDecoration(
              color: AppColors.black2,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  offset: Offset(0, 10),
                  blurRadius: 4,
                )
              ],
            )
          : BoxDecoration(color: AppColors.black2),
      padding: EdgeInsets.only(top: isPinned ? 8.r : topLift),
      child: SafeArea(
        top: isPinned,
        bottom: false,
        child: Padding(
          padding: EdgeInsets.only(bottom: _gap),
          child: TabBar(
            controller: controller,
            indicatorWeight: 3.r,
            indicatorColor: AppColors.yellow,
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,
            labelStyle: CustomTextStyles.style20w400
                .copyWith(color: AppColors.white, fontFamily: 'Roboto'),
            unselectedLabelStyle: CustomTextStyles.style20w400
                .copyWith(color: AppColors.white, fontFamily: 'Roboto'),
            tabs: [
              Padding(
                padding: EdgeInsets.only(bottom: 6.r),
                child: Tab(
                  text: context.getLocalization().watchList,
                  iconMargin: EdgeInsets.only(bottom: 6.r),
                  icon: SvgPicture.asset(
                    AppAssets.watchListIcon,
                    height: 24.h,
                    width: 38.w,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 6.r),
                child: Tab(
                  text: context.getLocalization().history,
                  iconMargin: EdgeInsets.only(bottom: 6.r),
                  icon: SvgPicture.asset(
                    AppAssets.historyIcon,
                    height: 30.h,
                    width: 36.w,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant _TabBarDelegate oldDelegate) {
    return false;
  }
}
