import 'package:flutter/material.dart';
import '../view/focus_management_view.dart';

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FocusManagementView(),
    );
  }
}