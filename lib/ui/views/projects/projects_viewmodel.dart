import 'package:doit/app/app.locator.dart';

import 'package:get_storage/get_storage.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProjectsViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  var projects = GetStorage().read('projects') ?? [];
}
