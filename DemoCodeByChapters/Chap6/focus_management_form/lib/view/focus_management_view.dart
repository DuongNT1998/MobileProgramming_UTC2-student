import 'package:flutter/material.dart';
import '../widgets/focus_text_field.dart';
import '../utils/focus_helper.dart';

class FocusManagementView extends StatefulWidget {
  const FocusManagementView({super.key});

  @override
  State<FocusManagementView> createState() => _FocusManagementViewState();
}

class _FocusManagementViewState extends State<FocusManagementView> {
  /// Tạo FocusNode cho từng field
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    /// Focus tự động vào field đầu tiên khi mở app
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusHelper.focusOnField(context: context, focusNode: nameFocusNode);
    });
  }

  @override
  void dispose() {
    nameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Focus Management Demo')),
      body: GestureDetector(
        /// Tap ra ngoài → ẩn bàn phím
        onTap: () {
          FocusHelper.unfocusAll(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              /// Name field
              FocusTextField(
                labelText: 'Name',
                focusNode: nameFocusNode,
                textInputAction: TextInputAction.next,
                onEditingComplete: () {
                  FocusHelper.moveToNextField(
                    context: context,
                    currentFocusNode: nameFocusNode,
                    nextFocusNode: emailFocusNode,
                  );
                },
              ),

              /// Email field
              FocusTextField(
                labelText: 'Email',
                focusNode: emailFocusNode,
                textInputAction: TextInputAction.next,
                onEditingComplete: () {
                  FocusHelper.moveToNextField(
                    context: context,
                    currentFocusNode: emailFocusNode,
                    nextFocusNode: passwordFocusNode,
                  );
                },
              ),

              /// Password field
              FocusTextField(
                labelText: 'Password',
                focusNode: passwordFocusNode,
                textInputAction: TextInputAction.done,
                onEditingComplete: () {
                  FocusHelper.unfocusAll(context);
                },
              ),

              const SizedBox(height: 20),

              /// Button focus vào Email
              ElevatedButton(
                onPressed: () {
                  FocusHelper.focusOnField(
                    context: context,
                    focusNode: emailFocusNode,
                  );
                },
                child: const Text('Focus Email Field'),
              ),

              const SizedBox(height: 10),

              /// Button ẩn bàn phím
              OutlinedButton(
                onPressed: () {
                  FocusHelper.unfocusAll(context);
                },
                child: const Text('Hide Keyboard'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
