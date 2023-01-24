import 'package:flutter/cupertino.dart';

class Information extends ChangeNotifier {
  String nome = '';
  void setName(String s) {
    nome = s;
    notifyListeners();
  }
}
