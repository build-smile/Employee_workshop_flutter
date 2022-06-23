import 'dart:io';

import 'package:employee_workshop/models/employee.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class StockForm extends StatefulWidget {
  final String buttonLabel;
  final Function submit;
  Employee employee;
  StockForm(
      {Key? key,
      required this.buttonLabel,
      required this.submit,
      required this.employee})
      : super(key: key);

  @override
  State<StockForm> createState() => _StockFormState();
}

class _StockFormState extends State<StockForm> {
  final _keyform = GlobalKey<FormState>();
  TextStyle lableStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Form(
        key: _keyform,
        child: Column(
          children: [
            ListTile(
              title: TextFormField(
                initialValue: widget.employee.firstName,
                onSaved: (String? value) => widget.employee.firstName = value!,
                validator: _validateString,
                decoration: InputDecoration(labelText: 'Firstname'),
              ),
            ),
            ListTile(
              title: TextFormField(
                initialValue: widget.employee.lastName,
                onSaved: (String? value) => widget.employee.lastName = value!,
                validator: _validateString,
                decoration: InputDecoration(labelText: 'Lastname'),
              ),
            ),
            ListTile(
              title: TextFormField(
                initialValue: widget.employee.position,
                onSaved: (String? value) => widget.employee.position = value!,
                validator: _validateString,
                decoration: InputDecoration(labelText: 'Position'),
              ),
            ),
            ListTile(
              leading: Text(
                'Start Date',
                style: lableStyle,
              ),
              title: TextButton(
                onPressed: () async {
                  widget.employee.staredDate = await getDatePicker();
                  setState(() {});
                },
                child: Text(
                  widget.employee.staredDate != null
                      ? DateFormat.yMMMMEEEEd()
                          .format(widget.employee.staredDate!)
                      : 'Choose Date',
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  widget.employee.staredDate = null;
                  setState(() {});
                },
              ),
            ),
            ListTile(
              leading: Text(
                'End Date',
                style: lableStyle,
              ),
              title: TextButton(
                onPressed: () async {
                  widget.employee.endedDate = await getDatePicker();
                  setState(() {});
                },
                child: Text(widget.employee.endedDate != null
                    ? DateFormat.yMMMMEEEEd().format(
                        widget.employee.endedDate!,
                      )
                    : 'Choose Date'),
              ),
              trailing: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  widget.employee.endedDate = null;
                  setState(() {});
                },
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
            ),
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

  Future<DateTime> getDatePicker() async {
    DateTime? date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(DateTime.now().year - 100),
          lastDate: DateTime.now(),
        ) ??
        DateTime.now();

    return date;
  }
}
