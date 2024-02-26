import 'package:flutter/cupertino.dart';
import 'package:hive_mobile/app/models/ui_state_model.dart';

class ProfileSectionWrapperProvider extends ChangeNotifier {
  var acceptedApplicationUIState = UiState.loading();

  var userAwardsVM = UiState.loading();

  bool get isLoading =>
      acceptedApplicationUIState.isLoading || userAwardsVM.isLoading;

  void updateAwardUiState(UiState state) {
    userAwardsVM = state;
    notifyListeners();
  }

  void updateAcceptedApplicationState(UiState state) {
    acceptedApplicationUIState = state;
    notifyListeners();
  }
}
