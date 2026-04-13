import 'package:flutter/material.dart';
import '../utils/app_inherited_widget.dart';
import 'screen_b.dart';

class ScreenA extends StatefulWidget {
  const ScreenA({super.key});

  @override
  State<ScreenA> createState() => _ScreenAState();
}

class _ScreenAState extends State<ScreenA> {
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
      appBar: AppBar(title: const Text('Screen A')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Counter value: ${controller.counterValue}',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.incrementCounter();
              },
              child: const Text('Increment Counter'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ScreenB()),
                );
              },
              child: const Text('Go to Screen B'),
            ),
          ],
        ),
      ),
    );
  }
}
