import 'package:employee_workshop/models/inventory.dart';
import 'package:flutter/material.dart';
import '../components/StockForm.dart';
import '../models/httpStatusMsg.dart';
import '../services/InventoryService.dart';
import '../utils/AlertHelper.dart';
import '../utils/LoadingProgress.dart';

class EditInventoryScreen extends StatefulWidget {
  const EditInventoryScreen({Key? key}) : super(key: key);

  @override
  State<EditInventoryScreen> createState() => _EditInventoryScreenState();
}

class _EditInventoryScreenState extends State<EditInventoryScreen> {
  @override
  Widget build(BuildContext context) {
    Inventory inv = ModalRoute.of(context)!.settings.arguments as Inventory;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Inventory'),
      ),
      body: ListView(
        children: [
          Container(
            child: StockForm(
              inv: inv,
              buttonLabel: 'Submit',
              submit: _submit,
            ),
          ),
          TextButton(
            onPressed: () => _delete(inv.id!),
            child: Text('Remove'),
          )
        ],
      ),
    );
  }

  test() {
    print('hi');
  }

  _submit(Inventory inventory) {
    LoadingProgress.inProgress(() async {
      InventoryService inventoryService = InventoryService();
      HttpStatusMsg res = await inventoryService.update(inventory);
      if (res.success) {
        AlertHelper.showBar(context: context, msg: 'Update complete');
        Navigator.pop(context);
      } else {
        AlertHelper.showBar(
            context: context, msg: res.errorMsg!, isError: true);
      }
    });
  }

  _delete(int id) async {
    AlertHelper.alertPopup(
      context: context,
      title: 'Delete?',
      desc: 'Are you sure want to Delete?',
      function: () {
        InventoryService inventoryService = InventoryService();
        LoadingProgress.inProgress(() async {
          HttpStatusMsg res = await inventoryService.delete(id);
          if (res.success) {
            AlertHelper.showBar(context: context, msg: 'Delete completed');
            Navigator.pop(context);
          } else {
            AlertHelper.showBar(
                context: context, msg: res.errorMsg!, isError: true);
          }
        });
      },
    );
  }
}
