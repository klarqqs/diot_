import 'package:doit/ui/views/auth/user_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stacked/stacked.dart';
import 'package:doit/app/app.locator.dart';
import 'package:doit/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final box = GetStorage();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    String? userEmail = box.read('userEmail');
    String? userName = box.read('userName');

    await Future.delayed(const Duration(seconds: 3));

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic

    userEmail != null
        ? _navigationService.replaceWithIntroView()
        : _navigationService.replaceWithBottomNavigationView(
            user: UserModel(
            name: userName,
            email: userEmail,
            phone: "",
            password: "",
          ));

    // _navigationService.replaceWithIntroView();
  }
}
