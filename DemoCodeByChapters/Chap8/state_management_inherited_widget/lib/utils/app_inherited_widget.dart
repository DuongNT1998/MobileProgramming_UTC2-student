import 'package:flutter/material.dart';
import '../controllers/counter_controller.dart';

class AppInheritedWidget extends InheritedWidget {
  final CounterController counterController;

  const AppInheritedWidget({
    super.key,
    required this.counterController,
    required Widget child,
  }) : super(child: child);

  // Hàm để lấy dữ liệu từ context
  static AppInheritedWidget of(BuildContext context) {
    final AppInheritedWidget? result = context
        .dependOnInheritedWidgetOfExactType<AppInheritedWidget>();

    assert(result != null, 'No AppInheritedWidget found in context');

    return result!;
  }

  @override
  bool updateShouldNotify(AppInheritedWidget oldWidget) {
    return true;
  }
}
