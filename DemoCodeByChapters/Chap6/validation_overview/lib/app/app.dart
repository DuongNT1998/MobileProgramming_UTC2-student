import 'package:flutter/material.dart';
import '../view/register_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Validation Demo',
      debugShowCheckedModeBanner: false,
      home: const RegisterFormView(),
    );
  }
}
