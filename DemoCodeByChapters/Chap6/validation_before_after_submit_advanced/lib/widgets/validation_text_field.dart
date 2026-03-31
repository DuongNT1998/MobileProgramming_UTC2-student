import 'package:flutter/material.dart';

class ValidationTextField extends StatelessWidget {
  final String label;
  final String? Function(String?) validator;
  final AutovalidateMode autoValidateMode;

  const ValidationTextField({
    super.key,
    required this.label,
    required this.validator,
    required this.autoValidateMode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autoValidateMode, // 🔥 KEY
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: validator,
    );
  }
}
