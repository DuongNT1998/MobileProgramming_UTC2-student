import 'package:flutter/material.dart';

class FocusTextField extends StatelessWidget {
  final String labelText;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final VoidCallback? onEditingComplete;

  const FocusTextField({
    super.key,
    required this.labelText,
    required this.focusNode,
    required this.textInputAction,
    this.onEditingComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        focusNode: focusNode,
        textInputAction: textInputAction,
        onEditingComplete: onEditingComplete,
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
