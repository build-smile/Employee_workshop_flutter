import 'package:employee_workshop/models/employee.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EmployeeForm extends StatefulWidget {
  final String buttonLabel;
  final Function submit;
  const EmployeeForm(
      {Key? key, required this.buttonLabel, required this.submit})
      : super(key: key);

  @override
  State<EmployeeForm> createState() => _EmployeeFormState();
}

class _EmployeeFormState extends State<EmployeeForm> {
  Employee employee = Employee();
  final _keyform = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //setState((){});
    return Container(
      margin: EdgeInsets.all(10),
      child: Form(
        key: _keyform,
        child: Column(
          children: [
            ListTile(
              title: TextFormField(
                onSaved: (String? value) => employee.firstName = value!,
                validator: _validateString,
                decoration: InputDecoration(labelText: 'Firstname'),
              ),
            ),
            ListTile(
              title: TextFormField(
                onSaved: (String? value) => employee.lastName = value!,
                validator: _validateString,
                decoration: InputDecoration(labelText: 'Lastname'),
              ),
            ),
            ListTile(
              title: TextFormField(
                onSaved: (String? value) => employee.position = value!,
                validator: _validateString,
                decoration: InputDecoration(labelText: 'Position'),
              ),
            ),
            Text(
              'Start Date',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () async {
                employee.staredDate = (await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1920, 8),
                  lastDate: DateTime(2101),
                ))!;
                setState(() {});
              },
              child: Row(
                children: [
                  Icon(Icons.calendar_today),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                      '${employee.staredDate?.day}/${employee.staredDate?.month}/${employee.staredDate?.year} '),

                  // Text('${DateFormat.yMd().format(employee.staredDate)}'),
                ],
              ),
            ),
            Text(
              'Ended Date',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () async {
                employee.staredDate = (await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(
                    DateTime.now().year - 100,
                  ),
                  lastDate: DateTime.now(),
                ))!;
                setState(() {});
              },
              child: Row(
                children: [
                  Icon(Icons.calendar_today),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                      '${employee.staredDate?.day}/${employee.staredDate?.month}/${employee.staredDate?.year} '),

                  // Text('${DateFormat.yMd().format(employee.staredDate)}'),
                ],
              ),
            ),
            ListTile(
              title: ElevatedButton(
                onPressed: () {
                  if (_keyform.currentState!.validate()) {
                    _keyform.currentState!.save();
                    // widget.submit();
                  }
                },
                child: Text(widget.buttonLabel),
              ),
            )
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
