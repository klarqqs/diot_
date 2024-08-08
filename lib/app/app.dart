import 'package:doit/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:doit/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:doit/ui/views/home/home_view.dart';
import 'package:doit/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:doit/ui/views/auth/auth_view.dart';
import 'package:doit/ui/views/intro/intro_view.dart';
import 'package:doit/ui/views/projects/projects_view.dart';
import 'package:doit/ui/views/create_item/create_item_view.dart';
import 'package:doit/ui/views/bottom_nav/bottom_nav_view.dart';
import 'package:doit/ui/views/bottom_navigation/bottom_navigation_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: AuthView),
    MaterialRoute(page: IntroView),
    MaterialRoute(page: ProjectsView),
    MaterialRoute(page: CreateItemView),
    MaterialRoute(page: BottomNavView),
    MaterialRoute(page: BottomNavigationView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
