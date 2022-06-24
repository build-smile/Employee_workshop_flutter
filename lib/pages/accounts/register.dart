import 'package:employee_workshop/components/UserForm.dart';
import 'package:employee_workshop/models/httpStatusMsg.dart';
import 'package:employee_workshop/services/UserService.dart';
import 'package:employee_workshop/utils/AlertHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

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

  submit(String username, String password) async {
    print('username: $username passname: $password');
    UserService userService = UserService();
    EasyLoading.show(status: 'Loading..');
    HttpStatusMsg result =
        await userService.register(username: username, password: password);
    if (result.success) {
      AlertHelper.showBar(context: context, msg: 'Registered');
      Navigator.pop(context);
    } else {
      AlertHelper.showBar(
        context: context,
        msg: result.errorMsg!,
        isError: true,
      );
    }
    EasyLoading.dismiss();
  }
}
