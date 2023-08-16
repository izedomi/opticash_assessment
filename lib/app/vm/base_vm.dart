import 'package:flutter/material.dart';

class BaseVM extends ChangeNotifier {
  reset() {}

  notify() {
    notifyListeners();
  }
}
