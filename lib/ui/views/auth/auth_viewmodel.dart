import 'package:doit/app/app.locator.dart';
import 'package:doit/app/app.router.dart';
import 'package:doit/ui/views/auth/user_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthViewModel extends BaseViewModel {
  final TextEditingController password = TextEditingController(),
      email = TextEditingController(),
      phone = TextEditingController(),
      name = TextEditingController();
  bool pageToggle = true;

  final box = GetStorage();

  final navigationService = locator<NavigationService>();

  void togglePage() {
    pageToggle = !pageToggle;
    notifyListeners();
  }

  void navigateToHome() async {
    await box.write('userEmail', email.text);
    await box.write('userName', name.text);

    navigationService.replaceWithHomeView(
      user: UserModel(
        name: name.text == "" ? email.text.split('@')[0] : name.text,
        email: email.text,
        phone: phone.text,
        password: password.text,
      ),
    );
  }
}
