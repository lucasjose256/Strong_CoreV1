import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  // ignore: unused_field
  static SharedPreferences? _preferences = null;
  static const stps1 = 'stepsCont1';
  static const stps2 = 'stepsCont2';
  static const stps3 = 'stepsCont3';
  static const list = 'lista';
  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setList(List<String> grau) async {
    await _preferences!.setStringList(list, grau);
  }

  static List<String>? getList() {
    return _preferences?.getStringList(list);
  }

  static Future setSteps(int numberSemana, int s) async {
    switch (numberSemana) {
      case 1:
        await _preferences!.setInt(stps1, s);

        break;
      case 2:
        await _preferences!.setInt(stps2, s);

        break;
      case 3:
        await _preferences!.setInt(stps3, s);

        break;

      default:
        await _preferences!.setInt(stps1, s);
    }
  }

  static int? getSteps(int numberSemana) {
    switch (numberSemana) {
      case 1:
        return _preferences!.getInt(stps1);
      case 2:
        return _preferences!.getInt(stps2);
      case 3:
        return _preferences!.getInt(stps3);

      default:
    }
  }
}
