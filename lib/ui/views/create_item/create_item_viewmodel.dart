import 'package:doit/app/app.locator.dart';
import 'package:doit/app/app.router.dart';
import 'package:doit/ui/views/auth/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'dart:math';
import 'package:intl/intl.dart';

final random = Random();

class CreateItemViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();

  final TextEditingController name = TextEditingController();
  final TextEditingController created = TextEditingController();
  final TextEditingController end = TextEditingController();
  final TextEditingController description = TextEditingController();

  final DateTime createdD = DateTime.now();
  final DateTime endD = DateTime.now();
  final GetStorage box = GetStorage();

  String selectedAvatar = "";
  List<String> selectedTags = [];
  List<String> selectedStaffs = [];
  List<String> addedTags = [];
  var projects = GetStorage().read('projects') ?? [];
  var tasks = GetStorage().read('tasks') ?? [];

  void addStaffs(String newStaff) {
    if (selectedStaffs.contains(newStaff)) {
      removeStaff(newStaff);
    } else {
      addStaff(newStaff);
    }
    notifyListeners();
  }

  void addStaff(String staff) {
    selectedStaffs.add(staff);
  }

  void removeStaff(String staff) {
    selectedStaffs.remove(staff);
  }

  void addTags(String newTag) {
    if (selectedTags.contains(newTag)) {
      removeTag(newTag);
    } else if (newTag.isNotEmpty) {
      addTag(newTag);
    }
    notifyListeners();
  }

  void addTag(String tag) {
    selectedTags.add(tag);
  }

  void removeTag(String tag) {
    selectedTags.remove(tag);
  }

  void addProject() async {
    if (_validateInputs()) {
      Map<String, dynamic> newProject = {
        "name": name.text,
        "created": createdD.toString(),
        "end": endD.toString(),
        "staffs": selectedStaffs,
        "tags": selectedTags,
        "description": description.text,
      };

      projects.add(newProject);
      notifyListeners();

      await box.write('projects', projects);

      _navigateToHomeView();
    }
  }

  void addTask() async {
    if (_validateInputs()) {
      Map<String, dynamic> newTask = {
        "name": name.text,
        "created": createdD.toString(),
        "end": endD.toString(),
        "staffs": selectedStaffs,
        "tags": selectedTags,
        "description": description.text,
        "isCompleted": false,
        "isOverdue": false,
      };

      tasks.add(newTask);
      notifyListeners();

      await box.write('tasks', tasks);

      _navigateToHomeView();
    }
  }

  bool _validateInputs() {
    if (name.text.isEmpty ||
        created.text.isEmpty ||
        end.text.isEmpty ||
        description.text.isEmpty) {
      // Handle validation error
      return false;
    }
    return true;
  }

  void _navigateToHomeView() {
    String? userEmail = box.read('userEmail');
    String? userName = box.read('userName');

    navigationService.replaceWithHomeView(
      user: UserModel(
        name: userName,
        email: userEmail,
        phone: "",
        password: "",
      ),
    );
  }

  void showCupertinoDatePicker(BuildContext context,
      TextEditingController textController, DateTime selectedDate) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 300,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 200,
              child: CupertinoDatePicker(
                minimumDate: DateTime.now().subtract(const Duration(hours: 1)),
                mode: CupertinoDatePickerMode.date,
                initialDateTime: selectedDate,
                onDateTimeChanged: (DateTime newDate) {
                  selectedDate = newDate;
                  textController.text =
                      DateFormat('yyyy-MM-dd').format(newDate);
                  notifyListeners();
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: CupertinoButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> tags = [
  "Design",
  "Frontend",
  "Backend",
  "Quality Assurance",
  "scrum",
  "Product",
  "Frontend Mobile",
];

List<String> staffs = [
  "Kelvin",
  "Jane",
  "Patrick",
  "Jacobs",
  "Lizzy",
];

List<String> avatars = [
  "assets/noun-fruits-5962723.svg",
  "assets/noun-fruits-5962726.svg",
  "assets/noun-fruits-5962734.svg",
  "assets/noun-fruits-5962735.svg",
  "assets/noun-fruits-5962738.svg",
  "assets/noun-fruits-5962749.svg",
];

String getARandomAvatar() {
  int randomIndex = random.nextInt(avatars.length);
  return avatars[randomIndex];
}
