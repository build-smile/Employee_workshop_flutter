import 'package:employee_workshop/models/httpStatusMsg.dart';
import 'package:employee_workshop/models/inventory.dart';
import 'package:employee_workshop/services/InventoryService.dart';
import 'package:employee_workshop/utils/AlertBar.dart';
import 'package:employee_workshop/utils/LoadingProgress.dart';
import 'package:flutter/material.dart';

import '../components/StockForm.dart';

class AddInventoryScreen extends StatefulWidget {
  const AddInventoryScreen({Key? key}) : super(key: key);

  @override
  State<AddInventoryScreen> createState() => _AddInventoryScreenState();
}

class _AddInventoryScreenState extends State<AddInventoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Employee Form'),
      ),
      body: ListView(children: [
        Container(
          child: StockForm(
            inv: Inventory(),
            buttonLabel: 'Submit',
            submit: _submit,
          ),
        ),
      ]),
    );
  }

  void _submit(Inventory inventory) {
    LoadingProgress.inProgress(() async {
      InventoryService inventoryService = InventoryService();
      HttpStatusMsg res = await inventoryService.insert(inventory);
      if (res.success) {
        AlertHelper.showBar(context: context, msg: 'Insert complete');
        Navigator.pop(context);
      } else {
        AlertHelper.showBar(
            context: context, msg: res.errorMsg!, isError: true);
      }
    });
  }
}
