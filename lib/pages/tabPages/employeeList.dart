import 'package:employee_workshop/models/employee.dart';
import 'package:flutter/material.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({Key? key}) : super(key: key);

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int i) {
          Employee employee = Employee(
            firstName: 'Nat',
            lastName: 'Hee',
            position: 'Hee',
            staredDate: DateTime.now(),
            endedDate: DateTime.now(),
          );
          return ListTile(
            leading: Text('ff'),
            title: Text('Build'),
            subtitle: Text('ddd'),
            trailing: Text('fef'),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/edit',
                arguments: employee,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
