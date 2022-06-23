import 'package:employee_workshop/pages/addEmployee.dart';
import 'package:employee_workshop/pages/accounts/login.dart';
import 'package:employee_workshop/pages/accounts/register.dart';
import 'package:employee_workshop/pages/editEmployee.dart';
import 'package:employee_workshop/pages/home.dart';
import 'package:employee_workshop/utils/LocalStorage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/register': (context) => RegisterScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/add': (context) => AddEmployeeScreen(),
        '/edit': (context) => EditEmployeeScreen()
      },
      builder: EasyLoading.init(),
      home: FutureBuilder(
          future: LocalStorage().getToken(),
          builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
            if (snapshot.hasData) {
              return HomeScreen();
            }
            return LoginScreen();
          }),
    );
  }
}
