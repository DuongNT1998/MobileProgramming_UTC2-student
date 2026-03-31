import 'package:flutter/material.dart';

class FocusUtils {
  static void moveToNext(
    BuildContext context,
    FocusNode current,
    FocusNode next,
  ) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }
}
