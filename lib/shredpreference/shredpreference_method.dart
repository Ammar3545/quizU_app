import 'package:shared_preferences/shared_preferences.dart';

class ShredPreferenceMethod {
  SharedPreferences? sharedPreferences;

  setData({required String key, required String data}) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences!.setString(key, data);
  }

  Future<String> getData({required String key}) async {
    sharedPreferences = await SharedPreferences.getInstance();
    String data = sharedPreferences!.getString(key)!;
    return data;
  }

  Future<bool> isDataExiste({required String key}) async {
    sharedPreferences = await SharedPreferences.getInstance();
    bool result = sharedPreferences!.containsKey(key);
    return result;
  }

  setListOfData({required String key, required List<String> data}) async {
    sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences!.setStringList(key, data);
  }

  Future<List<String>> getListOfData({required String key}) async {
    sharedPreferences = await SharedPreferences.getInstance();
    List<String> data = sharedPreferences!.getStringList(key)!;
    return data;
  }

  deleteKey({required String key}) async {
    sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences!.remove(key);
  }
}
