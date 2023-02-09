import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  // ignore: unused_field
  static SharedPreferences? _preferences = null;
  static const stps1 = 'stepsCont1';
  static const stps2 = 'stepsCont2';
  static const stps3 = 'stepsCont3';
  static const stps4 = 'stepsCont4';
  static const stps5 = 'stepsCont5';
  static const stps6 = 'stepsCont6';
  static const stps7 = 'stepsCont7';
  static const stps8 = 'stepsCont8';
  static const stps9 = 'stepsCont9';

  static const list = 'lista';
  static const flagPrimeiroAcesso = 'primeroAcesso';
  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setList(List<String> grau) async {
    await _preferences!.setStringList(list, grau);
  }

  static List<String>? getList() {
    return _preferences?.getStringList(list);
  }

  static Future setBool(bool value) async {
    await _preferences?.setBool(flagPrimeiroAcesso, value);
  }

  static bool? getBool() {
    return _preferences?.getBool(flagPrimeiroAcesso);
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
      case 4:
        await _preferences!.setInt(stps4, s);

        break;
      case 5:
        await _preferences!.setInt(stps5, s);

        break;
      case 6:
        await _preferences!.setInt(stps6, s);

        break;
      case 7:
        await _preferences!.setInt(stps7, s);

        break;
      case 8:
        await _preferences!.setInt(stps8, s);

        break;
      case 9:
        await _preferences!.setInt(stps9, s);

        break;
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

      case 4:
        return _preferences!.getInt(stps4);

      case 5:
        return _preferences!.getInt(stps5);

      case 6:
        return _preferences!.getInt(stps6);
      case 7:
        return _preferences!.getInt(stps7);
      case 8:
        return _preferences!.getInt(stps8);
      case 9:
        return _preferences!.getInt(stps9);

      default:
    }
  }
}
