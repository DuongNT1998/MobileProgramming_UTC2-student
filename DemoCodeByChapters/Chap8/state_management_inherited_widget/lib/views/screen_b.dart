import 'package:flutter/material.dart';
import '../utils/app_inherited_widget.dart';

class ScreenB extends StatefulWidget {
  const ScreenB({super.key});

  @override
  State<ScreenB> createState() => _ScreenBState();
}

class _ScreenBState extends State<ScreenB> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final controller = AppInheritedWidget.of(context).counterController;

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = AppInheritedWidget.of(context).counterController;

    return Scaffold(
      appBar: AppBar(title: const Text('Screen B')),
      body: Center(
        child: Text(
          'Counter value: ${controller.counterValue}',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
