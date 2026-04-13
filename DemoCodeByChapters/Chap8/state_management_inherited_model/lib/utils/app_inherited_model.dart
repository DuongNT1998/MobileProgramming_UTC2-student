import 'package:flutter/material.dart';
import '../controllers/app_controller.dart';

enum AppAspect { counter, userName }

class AppInheritedModel extends InheritedModel<AppAspect> {
  final AppController appController;

  const AppInheritedModel({
    super.key,
    required this.appController,
    required Widget child,
  }) : super(child: child);

  static AppInheritedModel of(BuildContext context, AppAspect aspect) {
    final AppInheritedModel? result = context
        .dependOnInheritedWidgetOfExactType<AppInheritedModel>();

    if (result == null) {
      throw Exception('No AppInheritedModel found in context');
    }

    // Đăng ký dependency theo aspect
    InheritedModel.inheritFrom<AppInheritedModel>(context, aspect: aspect);

    return result;
  }

  @override
  bool updateShouldNotify(AppInheritedModel oldWidget) {
    return true;
  }

  @override
  bool updateShouldNotifyDependent(
    AppInheritedModel oldWidget,
    Set<AppAspect> dependencies,
  ) {
    // CHỈ notify đúng phần thay đổi

    if (dependencies.contains(AppAspect.counter) &&
        oldWidget.appController.counterValue != appController.counterValue) {
      return true;
    }

    if (dependencies.contains(AppAspect.userName) &&
        oldWidget.appController.userName != appController.userName) {
      return true;
    }

    return false;
  }
}
