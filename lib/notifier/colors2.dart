import 'package:flutter/material.dart';

class Cor2 with ChangeNotifier {
  Color? cor;
  void changeColor(Color? c) {
    cor = c;
    notifyListeners();
  }
}
