import 'package:flutter/material.dart';

import '../components/EmployeeForm.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({Key? key}) : super(key: key);

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  @override
  Widget build(BuildContext context) {
    //Todo add form field
    //First Name
    //LastName
    //Position
    //started date picker button intl limit -80 - 100year
    //ended date picker button intl

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Employee Form'),
      ),
      body: ListView(children: [
        Container(
          child: EmployeeForm(
            buttonLabel: 'Test',
            submit: submit,
          ),
        ),
      ]),
    );
  }

  void submit() {}
}
