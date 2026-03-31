import 'package:flutter/material.dart';
import '../models/form_field_model.dart';

class DynamicTextField extends StatelessWidget {
  final FormFieldModel field;
  final VoidCallback onRemove;

  const DynamicTextField({
    super.key,
    required this.field,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          /// TextField chiếm phần lớn
          Expanded(
            child: TextField(
              controller: field.controller,
              decoration: InputDecoration(
                labelText: field.label,
                border: const OutlineInputBorder(),
              ),
            ),
          ),

          const SizedBox(width: 10),

          /// Nút xóa field
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: onRemove,
          ),
        ],
      ),
    );
  }
}
