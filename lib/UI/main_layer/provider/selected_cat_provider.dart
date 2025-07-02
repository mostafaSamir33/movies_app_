import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_constants.dart';

class SelectedCatProvider extends ChangeNotifier {
  int selectedCat = 0;
  final ScrollController scrollController = ScrollController();
  final itemHeight = 42.0;

  void selectCat(String cat) {
    selectedCat = AppConstants.genresList.indexWhere((e) => e == cat);
    notifyListeners();
    Future.delayed(Duration(milliseconds: 100), () {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!scrollController.hasClients) return;

        final offset = selectedCat * itemHeight;
        final max = scrollController.position.maxScrollExtent;

        scrollController.animateTo(
          offset.clamp(0, max), // ما نتخطاش آخر الليست
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    });
  }

  void unSelectCat() {
    selectedCat = 0;
    notifyListeners();
  }
}
