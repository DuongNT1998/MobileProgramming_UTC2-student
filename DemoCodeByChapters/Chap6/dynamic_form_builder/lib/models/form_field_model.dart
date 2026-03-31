import 'package:flutter/material.dart';

class FormFieldModel {
  final String id;
  final String label;
  final TextEditingController controller;

  FormFieldModel({
    required this.id,
    required this.label,
    required this.controller,
  });
}
