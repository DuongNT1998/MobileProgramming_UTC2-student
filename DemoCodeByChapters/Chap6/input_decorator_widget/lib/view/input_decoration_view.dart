import 'package:flutter/material.dart';
import '../widgets/styled_text_field.dart';
import '../utils/focus_utils.dart';

class InputDecorationView extends StatefulWidget {
  const InputDecorationView({super.key});

  @override
  State<InputDecorationView> createState() => _InputDecorationViewState();
}

class _InputDecorationViewState extends State<InputDecorationView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final FocusNode _nameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();

  String? _emailError;

  void _validateEmail() {
    if (!_emailController.text.contains('@')) {
      setState(() {
        _emailError = 'Email must contain @';
      });
    } else {
      setState(() {
        _emailError = null;
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _nameFocus.dispose();
    _emailFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Input Decoration Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// 1. Outline Border
            StyledTextField(
              label: 'Name',
              hint: 'Enter your name',
              prefixIcon: Icons.person,
              controller: _nameController,
              borderStyle: OutlineInputBorder(),
              helperText: 'This is your full name',
            ),

            const SizedBox(height: 16),

            /// 2. Underline Border + Error
            StyledTextField(
              label: 'Email',
              hint: 'Enter email',
              prefixIcon: Icons.email,
              controller: _emailController,
              borderStyle: UnderlineInputBorder(),
              errorText: _emailError,
            ),

            const SizedBox(height: 16),

            /// 3. No Border
            StyledTextField(
              label: 'No Border Field',
              hint: 'Minimal UI',
              prefixIcon: Icons.remove,
              controller: TextEditingController(),
              borderStyle: InputBorder.none,
              helperText: 'No border style',
            ),

            const SizedBox(height: 20),

            /// Button validate + focus
            ElevatedButton(
              onPressed: () {
                _validateEmail();

                FocusUtils.moveToNext(context, _nameFocus, _emailFocus);
              },
              child: const Text('Validate & Next Focus'),
            ),

            const SizedBox(height: 20),

            /// 4. InputDecorator demo
            InputDecorator(
              decoration: InputDecoration(
                labelText: 'Custom Decorator',
                border: OutlineInputBorder(),
              ),
              child: const Text('This is custom content inside'),
            ),
          ],
        ),
      ),
    );
  }
}
