import 'package:employee_workshop/components/UserForm.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: UserForm(
        buttonLabel: 'Register',
        submit: submit,
      ),
    );
  }

  submit(String username, String password) {
    print('username: $username passname: $password');
    Navigator.pop(context);
  }
}
