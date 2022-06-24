import 'dart:io';

import 'package:employee_workshop/models/inventory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class StockForm extends StatefulWidget {
  final String buttonLabel;
  final Function submit;
  Inventory inv;
  StockForm(
      {Key? key,
      required this.buttonLabel,
      required this.submit,
      required this.inv})
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
                initialValue: widget.inv.description,
                onSaved: (String? value) => widget.inv.description = value!,
                validator: _validateString,
                decoration: InputDecoration(labelText: 'Name'),
              ),
            ),
            ListTile(
              title: TextFormField(
                keyboardType: TextInputType.number,
                initialValue: widget.inv.stock.toString(),
                onSaved: (String? value) =>
                    widget.inv.stock = double.parse(value!),
                validator: _validateNumber,
                decoration: InputDecoration(labelText: 'Stock'),
              ),
            ),
            ListTile(
              title: TextFormField(
                keyboardType: TextInputType.number,
                initialValue: widget.inv.price.toString(),
                onSaved: (String? value) =>
                    widget.inv.price = double.parse(value!),
                validator: _validateNumber,
                decoration: InputDecoration(labelText: 'price'),
              ),
            ),
            ListTile(
              title: ElevatedButton(
                onPressed: () {
                  if (_keyform.currentState!.validate()) {
                    _keyform.currentState!.save();

                    widget.submit(widget.inv);
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

  String? _validateNumber(String? value) {
    if (value!.isEmpty) {
      return 'Please fill data';
    }
    if (double.tryParse(value) == null) {
      return 'Invalid number';
    }
    return null;
  }
}
