import 'package:dddd_mobile/app/app.locator.dart';
import 'package:dddd_mobile/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void goToGetCameraView() {
    _navigationService.navigateToGetCameraView();
  }

  void goToSettingsView() {
    _navigationService.navigateToSettingsView();
  }
}
