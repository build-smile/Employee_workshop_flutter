import 'package:flutter/material.dart';

class UserForm extends StatelessWidget {
  final String buttonLabel;
  final Function submit;

  const UserForm({Key? key, required this.submit, required this.buttonLabel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _keyform = GlobalKey<FormState>();
    String username = '';
    String password = '';
    return Container(
      margin: EdgeInsets.all(10),
      child: Form(
        key: _keyform,
        child: Column(
          children: [
            ListTile(
              title: TextFormField(
                onSaved: (String? value) => username = value!,
                validator: _validateString,
                decoration: InputDecoration(labelText: 'Username'),
              ),
            ),
            ListTile(
              title: TextFormField(
                onSaved: (String? value) => password = value!,
                validator: _validateString,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
              ),
            ),
            ListTile(
                title: ElevatedButton(
              onPressed: () {
                if (_keyform.currentState!.validate()) {
                  _keyform.currentState!.save();
                  submit(username, password);
                }
              },
              child: Text(buttonLabel),
            ))
          ],
        ),
      ),
    );
  }

  String? _validateString(String? value) {
    if (value!.isEmpty) {
      return 'Please fill data';
    }
    return null;
  }
}
