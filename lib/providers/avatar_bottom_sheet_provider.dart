import 'package:flutter/material.dart';

import '../models/avatar_bottom_sheet_model.dart';

class AvatarBottomSheetProvider extends ChangeNotifier {
  int? selectedIndex;
  String? selectedAvatar;

  void selectAvatar(int index) {
    selectedIndex = index;
    selectedAvatar = AvatarBottomSheetModel.avatarImages[selectedIndex??7].avatarImage;
    notifyListeners();
  }

  void initialAvatar() {
    if (selectedAvatar == null) {
      selectedIndex = 7;
      selectedAvatar =
          AvatarBottomSheetModel.avatarImages[selectedIndex ?? 7].avatarImage;
      notifyListeners();
    }
  }
}
