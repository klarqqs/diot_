import 'package:doit/app/app.bottomsheets.dart';
import 'package:doit/app/app.dialogs.dart';
import 'package:doit/app/app.locator.dart';
import 'package:doit/ui/common/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final navigationService = locator<NavigationService>();

  var projects = GetStorage().read('projects') ?? [];
  var tasks = GetStorage().read('tasks') ?? [];

  int totalProjects = 0, totalTasks = 0, completedTasks = 0, overdueTasks = 0;

  void getProjects() {
    totalProjects = projects.length;
    totalTasks = tasks.length;

    completedTasks = tasks.where((task) => task["isCompleted"] == true).length;
    overdueTasks = tasks.where((task) => task["isOverdue"] == true).length;

    dashboardCardModels = [
      DashboardCardModel(
        color: const Color(0xffFCF4F0),
        name: "Projects",
        icon: "assets/pro.svg",
        total: totalProjects,
      ),
      DashboardCardModel(
        color: const Color(0xffF4F9FF),
        name: "Tasks",
        icon: "assets/tasks.svg",
        total: totalTasks,
      ),
      DashboardCardModel(
        color: const Color(0xffE9FFF0),
        name: "Completed Tasks",
        icon: "assets/com_task.svg",
        total: completedTasks,
      ),
      DashboardCardModel(
        color: const Color(0xffF4F1F6),
        name: "Overdue Tasks",
        icon: "assets/over_tasks.svg",
        total: overdueTasks,
      ),
    ];

    notifyListeners();
  }

  List<DashboardCardModel> dashboardCardModels = [];

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }
}

class DashboardCardModel {
  final String name;
  final String icon;
  final Color color;
  final int total;

  DashboardCardModel({
    required this.name,
    required this.icon,
    required this.color,
    required this.total,
  });
}
