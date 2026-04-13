import 'package:flutter/material.dart';
import '../utils/app_inherited_model.dart';

class ScreenB extends StatelessWidget {
  const ScreenB({super.key});

  @override
  Widget build(BuildContext context) {
    final inheritedModel = AppInheritedModel.of(context, AppAspect.userName);

    final controller = inheritedModel.appController;

    return Scaffold(
      appBar: AppBar(title: const Text('Screen B - User Name')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'User Name: ${controller.userName}',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.changeUserName();
              },
              child: const Text('Change User Name'),
            ),
          ],
        ),
      ),
    );
  }
}
