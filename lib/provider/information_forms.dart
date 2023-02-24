import 'package:flutter/cupertino.dart';

class Information extends ChangeNotifier {
  String nome = '';

  String dataNascimento = '';

  String peso = '';

  String altura = '';

  String sexo = '';

  String posto = '';

  String cargo = '';

  String dataAdmissao = '';
  String question1 = '';
  String question2 = '';
  String question3 = '';
  String question4 = '';
  String question5 = '';
  String question6 = '';

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

  void setSexo(String s) {
    sexo = s;
    notifyListeners();
  }

  void setNascimento(String n) {
    dataNascimento = n;
    notifyListeners();
  }

  void setAltura(String a) {
    altura = a;
    notifyListeners();
  }

  void setPosto(String p) {
    posto = p;
    notifyListeners();
  }

  void setCargo(String c) {
    cargo = c;
    notifyListeners();
  }

  void setDataAdmissao(String a) {
    dataAdmissao = a;
    notifyListeners();
  }

  void setQuestion1(String q) {
    question1 = q;
    notifyListeners();
  }

  void setQuestion2(String q) {
    question2 = q;
    notifyListeners();
  }

  void setQuestion3(String q) {
    question3 = q;
    notifyListeners();
  }

  void setQuestion4(String q) {
    question4 = q;
    notifyListeners();
  }

  void setQuestion5(String q) {
    question5 = q;
    notifyListeners();
  }

  void setQuestion6(String q) {
    question6 = q;
    notifyListeners();
  }
}
