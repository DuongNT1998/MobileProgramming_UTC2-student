import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../utils/dialog_utils.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              text: "Show Simple Dialog",
              onPressed: () {
                DialogUtils.showSimpleDialog(context);
              },
            ),

            const SizedBox(height: 20),

            CustomButton(
              text: "Show Confirm Dialog",
              onPressed: () {
                DialogUtils.showConfirmDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
