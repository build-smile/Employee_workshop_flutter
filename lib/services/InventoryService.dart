import 'dart:convert';

import 'package:employee_workshop/models/httpStatusMsg.dart';
import 'package:employee_workshop/models/inventory.dart';
import 'package:employee_workshop/utils/LocalStorage.dart';

import '../constant.dart';
import 'package:http/http.dart' as http;

class InventoryService {
  LocalStorage localStorage = LocalStorage();

  Future<List<Inventory?>?> getAll() async {
    Uri uri = Uri.parse('$HOST/inventory/');
    String? token = await localStorage.getToken();
    if (token == null) {
      print('Token is null');
      return null;
    }
    final response = await http.get(
      uri,
      headers: {'Authorization': 'Bearer $token'},
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      List<Inventory> inv = result.map((i) => Inventory.fromJson(i)).toList();
      return inv;
    }

    return null;
  }

  Future<HttpStatusMsg> insert(Inventory inventory) async {
    Uri uri = Uri.parse('$HOST/inventory/');
    String? token = await localStorage.getToken();
    if (token == null) {
      print('Token is null');
      return HttpStatusMsg(success: false, errorMsg: 'Token invalid');
    }

    final response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(
        {
          "description": inventory.description,
          "price": inventory.price,
          "stock": inventory.stock
        },
      ),
    );
    print(response.body);
    HttpStatusMsg httpStatusMsg = HttpStatusMsg();
    if (response.statusCode == 200) {
      httpStatusMsg.success = true;
      return httpStatusMsg;
    }
    httpStatusMsg.success = false;
    httpStatusMsg.errorMsg = 'Something went wrong ${response.body}';
    return httpStatusMsg;
  }

  Future<HttpStatusMsg> update(Inventory inventory) async {
    Uri uri = Uri.parse('$HOST/inventory/${inventory.id}');
    String? token = await localStorage.getToken();
    if (token == null) {
      print('Token is null');
      return HttpStatusMsg(success: false, errorMsg: 'Token invalid');
    }

    final response = await http.put(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(
        {
          "description": inventory.description,
          "price": inventory.price,
          "stock": inventory.stock
        },
      ),
    );
    print(response.body);
    HttpStatusMsg httpStatusMsg = HttpStatusMsg();
    if (response.statusCode == 200) {
      httpStatusMsg.success = true;
      return httpStatusMsg;
    }
    httpStatusMsg.success = false;
    httpStatusMsg.errorMsg = 'Something went wrong ${response.body}';
    return httpStatusMsg;
  }

  Future<HttpStatusMsg> delete(int id) async {
    Uri uri = Uri.parse('$HOST/inventory/$id');
    print('$HOST/inventory/$id}');
    String? token = await localStorage.getToken();
    if (token == null) {
      print('Token is null');
      return HttpStatusMsg(success: false, errorMsg: 'Token invalid');
    }

    final response = await http.delete(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    print(response.body);
    HttpStatusMsg httpStatusMsg = HttpStatusMsg();
    if (response.statusCode == 200) {
      httpStatusMsg.success = true;
      return httpStatusMsg;
    }
    httpStatusMsg.success = false;
    httpStatusMsg.errorMsg = 'Something went wrong ${response.statusCode}';
    return httpStatusMsg;
  }
}
