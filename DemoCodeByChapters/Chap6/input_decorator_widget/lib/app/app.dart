import 'package:flutter/material.dart';
import '../view/input_decoration_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Input Decoration Demo',
      debugShowCheckedModeBanner: false,
      home: const InputDecorationView(),
    );
  }
}
