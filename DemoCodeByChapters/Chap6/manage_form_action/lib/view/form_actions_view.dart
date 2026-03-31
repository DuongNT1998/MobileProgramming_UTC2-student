import 'package:flutter/material.dart';
import '../widgets/form_text_field.dart';
import '../models/user_model.dart';

class FormActionsView extends StatefulWidget {
  const FormActionsView({super.key});

  @override
  State<FormActionsView> createState() => _FormActionsViewState();
}

class _FormActionsViewState extends State<FormActionsView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isFormValid = false;

  String _name = '';
  String _email = '';

  /// Validate realtime để bật/tắt button
  void _checkFormValidity() {
    final isValid = _formKey.currentState?.validate() ?? false;

    setState(() {
      _isFormValid = isValid;
    });
  }

  /// Submit form
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // 🔥 trigger onSaved

      UserModel user = UserModel(name: _name, email: _email);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Saved: ${user.name}, ${user.email}')),
      );
    }
  }

  /// Reset form
  void _resetForm() {
    _formKey.currentState?.reset();

    setState(() {
      _isFormValid = false;
      _name = '';
      _email = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Actions Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          onChanged: _checkFormValidity, // 🔥 realtime check
          child: Column(
            children: [
              /// Name field
              FormTextField(
                label: 'Name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name is required';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value ?? '';
                },
              ),

              /// Email field
              FormTextField(
                label: 'Email',
                validator: (value) {
                  if (value == null || !value.contains('@')) {
                    return 'Invalid email';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value ?? '';
                },
              ),

              const SizedBox(height: 20),

              /// Submit button (enable/disable)
              ElevatedButton(
                onPressed: _isFormValid ? _submitForm : null, // 🔥 key point
                child: const Text('Submit'),
              ),

              const SizedBox(height: 10),

              /// Reset button
              OutlinedButton(onPressed: _resetForm, child: const Text('Reset')),
            ],
          ),
        ),
      ),
    );
  }
}
