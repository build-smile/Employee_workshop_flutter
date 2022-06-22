import 'package:employee_workshop/pages/addEmployee.dart';
import 'package:employee_workshop/pages/accounts/login.dart';
import 'package:employee_workshop/pages/accounts/register.dart';
import 'package:employee_workshop/pages/editEmployee.dart';
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
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/add': (context) => AddEmployeeScreen(),
        '/edit': (context) => EditEmployeeScreen()
      },
      home: LoginScreen(),
    );
  }
}
