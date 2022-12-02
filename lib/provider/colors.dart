import 'package:flutter/material.dart';

class Cor1 with ChangeNotifier {
  Color? cor;
  void changeColor(Color? c) {
    cor = c;
    notifyListeners();
  }
}
