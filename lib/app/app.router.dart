// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:doit/ui/views/auth/auth_view.dart' as _i4;
import 'package:doit/ui/views/auth/user_model.dart' as _i11;
import 'package:doit/ui/views/bottom_nav/bottom_nav_view.dart' as _i8;
import 'package:doit/ui/views/bottom_navigation/bottom_navigation_view.dart'
    as _i9;
import 'package:doit/ui/views/create_item/create_item_view.dart' as _i7;
import 'package:doit/ui/views/home/home_view.dart' as _i2;
import 'package:doit/ui/views/intro/intro_view.dart' as _i5;
import 'package:doit/ui/views/projects/projects_view.dart' as _i6;
import 'package:doit/ui/views/startup/startup_view.dart' as _i3;
import 'package:flutter/material.dart' as _i10;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i12;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const authView = '/auth-view';

  static const introView = '/intro-view';

  static const projectsView = '/projects-view';

  static const createItemView = '/create-item-view';

  static const bottomNavView = '/bottom-nav-view';

  static const bottomNavigationView = '/bottom-navigation-view';

  static const all = <String>{
    homeView,
    startupView,
    authView,
    introView,
    projectsView,
    createItemView,
    bottomNavView,
    bottomNavigationView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.authView,
      page: _i4.AuthView,
    ),
    _i1.RouteDef(
      Routes.introView,
      page: _i5.IntroView,
    ),
    _i1.RouteDef(
      Routes.projectsView,
      page: _i6.ProjectsView,
    ),
    _i1.RouteDef(
      Routes.createItemView,
      page: _i7.CreateItemView,
    ),
    _i1.RouteDef(
      Routes.bottomNavView,
      page: _i8.BottomNavView,
    ),
    _i1.RouteDef(
      Routes.bottomNavigationView,
      page: _i9.BottomNavigationView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      final args = data.getArgs<HomeViewArguments>(nullOk: false);
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.HomeView(key: args.key, user: args.user),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.AuthView: (data) {
      final args = data.getArgs<AuthViewArguments>(
        orElse: () => const AuthViewArguments(),
      );
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i4.AuthView(key: args.key, isLogin: args.isLogin),
        settings: data,
      );
    },
    _i5.IntroView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.IntroView(),
        settings: data,
      );
    },
    _i6.ProjectsView: (data) {
      final args = data.getArgs<ProjectsViewArguments>(nullOk: false);
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.ProjectsView(
            key: args.key,
            projects: args.projects,
            tasks: args.tasks,
            isProject: args.isProject,
            isCompleted: args.isCompleted,
            isOverdue: args.isOverdue),
        settings: data,
      );
    },
    _i7.CreateItemView: (data) {
      final args = data.getArgs<CreateItemViewArguments>(
        orElse: () => const CreateItemViewArguments(),
      );
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => _i7.CreateItemView(
            key: args.key, isProject: args.isProject, project: args.project),
        settings: data,
      );
    },
    _i8.BottomNavView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.BottomNavView(),
        settings: data,
      );
    },
    _i9.BottomNavigationView: (data) {
      final args = data.getArgs<BottomNavigationViewArguments>(nullOk: false);
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i9.BottomNavigationView(key: args.key, user: args.user),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class HomeViewArguments {
  const HomeViewArguments({
    this.key,
    required this.user,
  });

  final _i10.Key? key;

  final _i11.UserModel user;

  @override
  String toString() {
    return '{"key": "$key", "user": "$user"}';
  }

  @override
  bool operator ==(covariant HomeViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.user == user;
  }

  @override
  int get hashCode {
    return key.hashCode ^ user.hashCode;
  }
}

class AuthViewArguments {
  const AuthViewArguments({
    this.key,
    this.isLogin = false,
  });

  final _i10.Key? key;

  final bool isLogin;

  @override
  String toString() {
    return '{"key": "$key", "isLogin": "$isLogin"}';
  }

  @override
  bool operator ==(covariant AuthViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.isLogin == isLogin;
  }

  @override
  int get hashCode {
    return key.hashCode ^ isLogin.hashCode;
  }
}

class ProjectsViewArguments {
  const ProjectsViewArguments({
    this.key,
    required this.projects,
    required this.tasks,
    this.isProject = true,
    this.isCompleted = false,
    this.isOverdue = false,
  });

  final _i10.Key? key;

  final List<dynamic> projects;

  final List<dynamic> tasks;

  final bool isProject;

  final bool isCompleted;

  final bool isOverdue;

  @override
  String toString() {
    return '{"key": "$key", "projects": "$projects", "tasks": "$tasks", "isProject": "$isProject", "isCompleted": "$isCompleted", "isOverdue": "$isOverdue"}';
  }

  @override
  bool operator ==(covariant ProjectsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.projects == projects &&
        other.tasks == tasks &&
        other.isProject == isProject &&
        other.isCompleted == isCompleted &&
        other.isOverdue == isOverdue;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        projects.hashCode ^
        tasks.hashCode ^
        isProject.hashCode ^
        isCompleted.hashCode ^
        isOverdue.hashCode;
  }
}

class CreateItemViewArguments {
  const CreateItemViewArguments({
    this.key,
    this.isProject = true,
    this.project,
  });

  final _i10.Key? key;

  final bool isProject;

  final dynamic project;

  @override
  String toString() {
    return '{"key": "$key", "isProject": "$isProject", "project": "$project"}';
  }

  @override
  bool operator ==(covariant CreateItemViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.isProject == isProject &&
        other.project == project;
  }

  @override
  int get hashCode {
    return key.hashCode ^ isProject.hashCode ^ project.hashCode;
  }
}

class BottomNavigationViewArguments {
  const BottomNavigationViewArguments({
    this.key,
    required this.user,
  });

  final _i10.Key? key;

  final _i11.UserModel user;

  @override
  String toString() {
    return '{"key": "$key", "user": "$user"}';
  }

  @override
  bool operator ==(covariant BottomNavigationViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.user == user;
  }

  @override
  int get hashCode {
    return key.hashCode ^ user.hashCode;
  }
}

extension NavigatorStateExtension on _i12.NavigationService {
  Future<dynamic> navigateToHomeView({
    _i10.Key? key,
    required _i11.UserModel user,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.homeView,
        arguments: HomeViewArguments(key: key, user: user),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAuthView({
    _i10.Key? key,
    bool isLogin = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.authView,
        arguments: AuthViewArguments(key: key, isLogin: isLogin),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToIntroView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.introView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProjectsView({
    _i10.Key? key,
    required List<dynamic> projects,
    required List<dynamic> tasks,
    bool isProject = true,
    bool isCompleted = false,
    bool isOverdue = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.projectsView,
        arguments: ProjectsViewArguments(
            key: key,
            projects: projects,
            tasks: tasks,
            isProject: isProject,
            isCompleted: isCompleted,
            isOverdue: isOverdue),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreateItemView({
    _i10.Key? key,
    bool isProject = true,
    dynamic project,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.createItemView,
        arguments: CreateItemViewArguments(
            key: key, isProject: isProject, project: project),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBottomNavView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.bottomNavView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBottomNavigationView({
    _i10.Key? key,
    required _i11.UserModel user,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.bottomNavigationView,
        arguments: BottomNavigationViewArguments(key: key, user: user),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView({
    _i10.Key? key,
    required _i11.UserModel user,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.homeView,
        arguments: HomeViewArguments(key: key, user: user),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAuthView({
    _i10.Key? key,
    bool isLogin = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.authView,
        arguments: AuthViewArguments(key: key, isLogin: isLogin),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithIntroView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.introView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProjectsView({
    _i10.Key? key,
    required List<dynamic> projects,
    required List<dynamic> tasks,
    bool isProject = true,
    bool isCompleted = false,
    bool isOverdue = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.projectsView,
        arguments: ProjectsViewArguments(
            key: key,
            projects: projects,
            tasks: tasks,
            isProject: isProject,
            isCompleted: isCompleted,
            isOverdue: isOverdue),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCreateItemView({
    _i10.Key? key,
    bool isProject = true,
    dynamic project,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.createItemView,
        arguments: CreateItemViewArguments(
            key: key, isProject: isProject, project: project),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBottomNavView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.bottomNavView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBottomNavigationView({
    _i10.Key? key,
    required _i11.UserModel user,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.bottomNavigationView,
        arguments: BottomNavigationViewArguments(key: key, user: user),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
