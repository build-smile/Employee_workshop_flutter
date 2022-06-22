import 'package:employee_workshop/components/UserForm.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: 200,
              margin: EdgeInsets.all(30),
              child: FlutterLogo(),
            ),
            Container(
              child: UserForm(
                buttonLabel: 'Login',
                submit: submit,
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Text('Register'))
          ],
        ),
      ),
    );
  }

  submit(String username, String password) {
    print('username: $username passname: $password');

    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
  }
}
