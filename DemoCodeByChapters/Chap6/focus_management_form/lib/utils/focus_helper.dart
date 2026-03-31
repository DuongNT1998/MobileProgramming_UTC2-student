import 'package:flutter/material.dart';

class FocusHelper {
  /// Chuyển sang field tiếp theo
  static void moveToNextField({
    required BuildContext context,
    required FocusNode currentFocusNode,
    required FocusNode nextFocusNode,
  }) {
    currentFocusNode.unfocus();
    FocusScope.of(context).requestFocus(nextFocusNode);
  }

  /// Bỏ focus toàn bộ (ẩn bàn phím)
  static void unfocusAll(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  /// Focus vào field cụ thể
  static void focusOnField({
    required BuildContext context,
    required FocusNode focusNode,
  }) {
    FocusScope.of(context).requestFocus(focusNode);
  }
}
