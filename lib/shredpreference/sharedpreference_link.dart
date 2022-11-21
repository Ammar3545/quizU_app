import 'shredpreference_method.dart';

class SharedPreferencesLink {
  saveTokenInSharedPreferences({required String key, required String token}) {
    ShredPreferenceMethod().setData(key: key, data: token);
  }

  Future<String> getTokenFromSharedPreferences({required String key}) async {
    String token = await ShredPreferenceMethod().getData(key: key);
    return token;
  }

  Future<bool> isTokenExiste({required String keyName}) async {
    bool isThereToken =
        await ShredPreferenceMethod().isDataExiste(key: keyName);
    return isThereToken;
  }

  saveUserInfo({required String key, required List<String> userInfo}) {
    ShredPreferenceMethod().setListOfData(key: key, data: userInfo);
  }

  Future<List<String>> getUserInfo({required String key}) async {
    List<String> userInfo =
        await ShredPreferenceMethod().getListOfData(key: key);
    return userInfo;
  }

  logoutUser({required String key}) {
    ShredPreferenceMethod().deleteKey(key: key);
  }
}
