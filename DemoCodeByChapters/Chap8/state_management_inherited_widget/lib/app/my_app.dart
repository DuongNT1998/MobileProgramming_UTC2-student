import 'package:flutter/material.dart';
import '../controllers/counter_controller.dart';
import '../utils/app_inherited_widget.dart';
import '../views/screen_a.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final CounterController counterController = CounterController();

  @override
  Widget build(BuildContext context) {
    return AppInheritedWidget(
      counterController: counterController,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const ScreenA(),
      ),
    );
  }
}
