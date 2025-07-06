import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/UI/main_layer/tabs/profileTab/providers/profile_tab_provider.dart';
import 'package:movies_app/UI/main_layer/tabs/profileTab/widgets/profile_tab_body/profile_tab_body.dart';
import 'package:movies_app/UI/main_layer/tabs/profileTab/widgets/profile_tab_header/profile_tab_header.dart';

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
              : Column(
                  children: [
                    ProfileTabHeader(
                      controller: controller,
                      profileData: provider.profileData,
                    ),
                    Expanded(
                      child: ProfileTabBody(
                          controller: controller,
                          allWatchedMovies: provider.watchedMovies,
                          favouriteMovies: provider.favouriteMovies),
                    ),
                  ],
                ),
    );
  }
}
