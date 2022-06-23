import 'dart:convert';
import 'dart:io';

import 'package:employee_workshop/models/httpStatusMsg.dart';

import '../constant.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<HttpStatusMsg> register(
      {required String username, required String password}) async {
    Uri uri = Uri.parse('$HOST/user/');
    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
        {
          "username": username,
          "password": password,
        },
      ),
    );

    HttpStatusMsg httpStatusMsg = HttpStatusMsg();
    if (response.statusCode == 200) {
      httpStatusMsg.success = true;
      return httpStatusMsg;
    } else if (response.statusCode == 400) {
      httpStatusMsg.success = false;
      httpStatusMsg.errorMsg = 'User already registered';
      return httpStatusMsg;
    }
    httpStatusMsg.success = false;
    httpStatusMsg.errorMsg = 'Something went wrong ${response.statusCode}';
    return httpStatusMsg;
  }

  Future<HttpStatusMsg> login(
      {required String username, required String password}) async {
    Uri uri = Uri.parse('$HOST/token');
    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        "username": username,
        "password": password,
      },
      encoding: Encoding.getByName('utf-8'),
    );

    HttpStatusMsg httpStatusMsg = HttpStatusMsg();
    print(response.statusCode);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      httpStatusMsg.success = true;
      httpStatusMsg.result = result['access_token'];
      print(result['access_token']);
      return httpStatusMsg;
    }
    httpStatusMsg.success = false;
    httpStatusMsg.errorMsg = 'Invalid user';
    return httpStatusMsg;
  }
}
