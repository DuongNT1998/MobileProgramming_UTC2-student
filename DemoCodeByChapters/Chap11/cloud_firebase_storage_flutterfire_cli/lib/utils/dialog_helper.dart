import 'package:flutter/material.dart';

class DialogHelper {
  // ✅ Success dialog (create/update)
  static void showSuccess(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Success"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  // ⚠️ Confirm delete
  static Future<bool> confirmDelete(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text("Confirm"),
            content: Text("Are you sure you want to delete?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text("Cancel"),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text("Delete"),
              ),
            ],
          ),
        ) ??
        false;
  }
}
