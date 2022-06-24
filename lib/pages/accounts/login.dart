import 'package:employee_workshop/components/UserForm.dart';
import 'package:employee_workshop/models/httpStatusMsg.dart';
import 'package:employee_workshop/services/UserService.dart';
import 'package:employee_workshop/utils/AlertBar.dart';
import 'package:employee_workshop/utils/LoadingProgress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../utils/LocalStorage.dart';

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

  submit(String username, String password) async {
    LoadingProgress.inProgress(() async {
      UserService userService = UserService();
      HttpStatusMsg result = HttpStatusMsg();
      result = await userService.login(username: username, password: password);
      if (result.success) {
        LocalStorage().storeToken('${result.result}');
        AlertHelper.showBar(context: context, msg: 'Welcome to My App');
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      } else {
        AlertHelper.showBar(
            context: context, msg: result.errorMsg!, isError: true);
      }
    });
  }
}
