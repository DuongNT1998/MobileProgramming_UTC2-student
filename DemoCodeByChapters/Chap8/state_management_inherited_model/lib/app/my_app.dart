import 'package:flutter/material.dart';
import '../controllers/app_controller.dart';
import '../utils/app_inherited_model.dart';
import '../views/screen_a.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppController appController = AppController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: appController,
      builder: (context, child) {
        return AppInheritedModel(
          appController: appController,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const ScreenA(),
          ),
        );
      },
    );
  }
}
