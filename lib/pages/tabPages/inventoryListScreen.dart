import 'package:employee_workshop/models/inventory.dart';
import 'package:employee_workshop/services/InventoryService.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class InventoryListScreen extends StatefulWidget {
  const InventoryListScreen({Key? key}) : super(key: key);

  @override
  State<InventoryListScreen> createState() => _InventoryListScreenState();
}

class _InventoryListScreenState extends State<InventoryListScreen> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    setState(() {});
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    print('loading');
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: InventoryService().getAll(),
          builder: (BuildContext context,
              AsyncSnapshot<List<Inventory?>?> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            List<Inventory?> inventories = snapshot.data!;
            return Scrollbar(
              child: SmartRefresher(
                controller: _refreshController,
                onLoading: _onLoading,
                onRefresh: _onRefresh,
                child: ListView.builder(
                  itemCount: inventories.length,
                  itemBuilder: (BuildContext context, int i) {
                    Inventory inv = inventories[i]!;

                    var f = NumberFormat("#,##0.00", "en_US");
                    String stock = f.format(inv.stock);
                    String price = f.format(inv.price);

                    return ListTile(
                      leading: Icon(Icons.ad_units),
                      title: Text(inv.description),
                      subtitle: Text('$stock unit'),
                      trailing: Text('$price Baht'),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/edit',
                          arguments: inv,
                        ).then((value) => setState(() {}));
                      },
                    );
                  },
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add').then((value) {
            setState(() {});
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
