import 'package:flutter/cupertino.dart';

class Information extends ChangeNotifier {
  String nome = '';
  String peso = '';
  String altura = '';
  String sexo = '';
  List<String> dores = [];
  void setName(String s) {
    nome = s;
    notifyListeners();
  }

  void setListDores(List<String> l) {
    dores = l;
    notifyListeners();
  }

  void setPeso(String p) {
    peso = p;
    notifyListeners();
  }

  void setSexo(String p) {
    peso = p;
    notifyListeners();
  }
}
