import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.validator,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
        ),
        validator: validator,
      ),
    );
  }
}
