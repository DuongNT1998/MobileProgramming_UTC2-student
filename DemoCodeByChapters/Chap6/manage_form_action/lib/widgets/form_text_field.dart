import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  final String label;
  final String? Function(String?) validator;
  final void Function(String?) onSaved;

  const FormTextField({
    super.key,
    required this.label,
    required this.validator,
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: validator,
        onSaved: onSaved, // 🔥 QUAN TRỌNG
      ),
    );
  }
}
