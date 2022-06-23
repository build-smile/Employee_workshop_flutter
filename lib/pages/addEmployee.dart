import 'package:employee_workshop/models/employee.dart';
import 'package:flutter/material.dart';

import '../components/StockForm.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({Key? key}) : super(key: key);

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Employee Form'),
      ),
      body: ListView(children: [
        Container(
          child: StockForm(
            employee: Employee(),
            buttonLabel: 'Submit',
            submit: _submit,
          ),
        ),
      ]),
    );
  }

  void _submit() {}
}
