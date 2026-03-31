import 'package:flutter/material.dart';
import '../widgets/validation_text_field.dart';
import '../utils/validators.dart';

class ValidationModesView extends StatefulWidget {
  const ValidationModesView({super.key});

  @override
  State<ValidationModesView> createState() => _ValidationModesViewState();
}

class _ValidationModesViewState extends State<ValidationModesView> {
  final GlobalKey<FormState> _formKeySubmit = GlobalKey<FormState>();

  void _submitForm() {
    if (_formKeySubmit.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Form valid!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Validation Modes Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// 🔵 1. Validate While Typing
            const Text('Validate While Typing', style: TextStyle(fontSize: 18)),

            ValidationTextField(
              label: 'Email',
              validator: Validators.validateEmail,
              autoValidateMode:
                  AutovalidateMode.onUserInteraction, // 🔥 realtime
            ),

            const SizedBox(height: 30),

            /// 🔴 2. Validate After Submit
            const Text('Validate After Submit', style: TextStyle(fontSize: 18)),

            Form(
              key: _formKeySubmit,
              child: Column(
                children: [
                  ValidationTextField(
                    label: 'Email',
                    validator: Validators.validateEmail,
                    autoValidateMode:
                        AutovalidateMode.disabled, // 🔥 chỉ khi submit
                  ),

                  const SizedBox(height: 10),

                  ElevatedButton(
                    onPressed: _submitForm,
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
