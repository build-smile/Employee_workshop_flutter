import 'package:employee_workshop/pages/AddEmployee.dart';
import 'package:employee_workshop/pages/accounts/login.dart';
import 'package:employee_workshop/pages/accounts/register.dart';
import 'package:employee_workshop/pages/home.dart';
import 'package:flutter/material.dart';

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
        '/home': (context) => HomeScreen(),
        '/add': (context) => AddEmployeeScreen()
      },
      home: LoginScreen(),
    );
  }
}
