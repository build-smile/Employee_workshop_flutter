import 'package:employee_workshop/models/employee.dart';
import 'package:flutter/material.dart';

import '../components/EmployeeForm.dart';

class EditEmployeeScreen extends StatefulWidget {
  const EditEmployeeScreen({Key? key}) : super(key: key);

  @override
  State<EditEmployeeScreen> createState() => _EditEmployeeScreenState();
}

class _EditEmployeeScreenState extends State<EditEmployeeScreen> {
  @override
  Widget build(BuildContext context) {
    Employee employee = ModalRoute.of(context)!.settings.arguments as Employee;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Employee'),
      ),
      body: ListView(
        children: [
          Container(
            child: EmployeeForm(
              employee: employee,
              buttonLabel: 'Submit',
              submit: _submit,
            ),
          ),
          TextButton(onPressed: () {}, child: Text('Remove'))
        ],
      ),
    );
  }

  _submit() {}
}
