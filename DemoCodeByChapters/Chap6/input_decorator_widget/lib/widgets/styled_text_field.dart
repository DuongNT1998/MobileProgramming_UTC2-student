import 'package:flutter/material.dart';

class StyledTextField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController controller;
  final InputBorder borderStyle;
  final String? errorText;
  final String? helperText;

  const StyledTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.prefixIcon,
    this.suffixIcon,
    required this.controller,
    required this.borderStyle,
    this.errorText,
    this.helperText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label, // label
        hintText: hint, // hint
        prefixIcon: Icon(prefixIcon), // icon trái
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null, // icon phải

        border: borderStyle, // border chính
        enabledBorder: borderStyle,
        focusedBorder: borderStyle,

        errorText: errorText, // lỗi
        helperText: helperText, // gợi ý
      ),
    );
  }
}
