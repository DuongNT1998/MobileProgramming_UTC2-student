import 'package:flutter/material.dart';
import '../view/dynamic_form_view.dart';

class DynamicFormApplication extends StatelessWidget {
  const DynamicFormApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DynamicFormView(),
    );
  }
}
