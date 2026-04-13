import 'package:flutter/material.dart';
import '../utils/app_inherited_model.dart';
import 'screen_b.dart';

class ScreenA extends StatelessWidget {
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    final inheritedModel = AppInheritedModel.of(context, AppAspect.counter);

    final controller = inheritedModel.appController;

    return Scaffold(
      appBar: AppBar(title: const Text('Screen A - Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Counter: ${controller.counterValue}',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.incrementCounter();
              },
              child: const Text('Increase Counter'),
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
