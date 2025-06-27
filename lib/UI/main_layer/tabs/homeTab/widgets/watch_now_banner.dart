import 'package:flutter/material.dart';
import '../../../../../core/utils/app_assets.dart';

class WatchNowBanner extends StatelessWidget {
  const WatchNowBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Image.asset(
        AppAssets.watchNow,
        width: MediaQuery.of(context).size.width * 0.92,
        height: 80,
        fit: BoxFit.contain,
      ),
    );
  }
}
