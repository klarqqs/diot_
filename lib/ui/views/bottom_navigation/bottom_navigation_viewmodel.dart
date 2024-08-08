import 'package:doit/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BottomNavigationViewModel extends BaseViewModel {
    final navigationService = locator<NavigationService>();

  int currentIndex = 0;

  void updateCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  getLoginDetails() async {
    notifyListeners();
  }
}
