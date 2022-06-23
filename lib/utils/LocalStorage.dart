import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  storeToken(String value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print('store: ${await pref.setString('token', value)}');
  }

  Future<String?> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    return token;
  }

  removeToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print('remove: ${await pref.remove('token')}');
  }
}
