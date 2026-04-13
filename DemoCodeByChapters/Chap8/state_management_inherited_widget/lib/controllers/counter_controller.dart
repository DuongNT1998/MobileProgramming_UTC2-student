import 'package:flutter/material.dart';
import '../models/counter_model.dart';

class CounterController extends ChangeNotifier {
  CounterModel counterModel = CounterModel(value: 0);

  int get counterValue {
    return counterModel.value;
  }

  void incrementCounter() {
    counterModel.value = counterModel.value + 1;

    // Thông báo cho UI biết dữ liệu đã thay đổi
    notifyListeners();
  }
}
