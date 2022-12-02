import 'package:flutter/material.dart';

class Check with ChangeNotifier {
  int? steps = 0;
  void changeSteps(int? s) {
    steps = s;
    notifyListeners();
  }
}
