import 'package:get/get.dart';

class NameProblemController extends GetxController {
  List<String> options = [
    'Dores Oteomusculares',
    'Entorse Articular',
    'Fratura Óssea',
    'Enxaqueca',
  ];

  Rx<List<String>> selectedOptionList = Rx<List<String>>([]);
  var selectedoption = ''.obs;

  void onInit() {
    super.onInit();
  }

  void onReady() {
    super.onReady();
  }

  void onClose() {
    super.onClose();
  }
}
