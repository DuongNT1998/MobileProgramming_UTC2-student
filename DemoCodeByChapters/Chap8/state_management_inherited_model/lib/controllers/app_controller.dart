import 'package:flutter/material.dart';
import '../models/app_model.dart';

class AppController extends ChangeNotifier {
  AppModel appModel = AppModel(counterValue: 0, userName: 'Flutter User');

  int get counterValue {
    return appModel.counterValue;
  }

  String get userName {
    return appModel.userName;
  }

  void incrementCounter() {
    appModel.counterValue = appModel.counterValue + 1;

    notifyListeners();
  }

  void changeUserName() {
    appModel.userName = 'User ${appModel.counterValue}';

    notifyListeners();
  }
}
