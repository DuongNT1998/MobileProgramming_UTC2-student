import 'package:flutter/material.dart';
import '../models/form_field_model.dart';
import '../widgets/dynamic_text_field.dart';

class DynamicFormView extends StatefulWidget {
  const DynamicFormView({super.key});

  @override
  State<DynamicFormView> createState() => _DynamicFormViewState();
}

class _DynamicFormViewState extends State<DynamicFormView> {
  final List<FormFieldModel> fields = [];

  int fieldCounter = 0;

  /// Thêm field mới
  void addField() {
    setState(() {
      fieldCounter++;

      fields.add(
        FormFieldModel(
          id: fieldCounter.toString(),
          label: 'Field $fieldCounter',
          controller: TextEditingController(),
        ),
      );
    });
  }

  /// Xóa field
  void removeField(String id) {
    setState(() {
      fields.removeWhere((element) => element.id == id);
    });
  }

  /// Lưu dữ liệu
  void saveForm() {
    for (var field in fields) {
      debugPrint('Field ${field.id}: ${field.controller.text}');
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Data printed in console')));
  }

  @override
  void dispose() {
    for (var field in fields) {
      field.controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dynamic Form Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            /// Danh sách field
            Expanded(
              child: ListView.builder(
                itemCount: fields.length,
                itemBuilder: (context, index) {
                  final field = fields[index];

                  return DynamicTextField(
                    field: field,
                    onRemove: () {
                      removeField(field.id);
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            /// Nút thêm field
            ElevatedButton(onPressed: addField, child: const Text('Add Field')),

            const SizedBox(height: 10),

            /// Nút save
            OutlinedButton(onPressed: saveForm, child: const Text('Save Data')),
          ],
        ),
      ),
    );
  }
}
