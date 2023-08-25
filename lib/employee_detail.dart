import 'package:flutter/material.dart';

import 'employee_model.dart';

class EmployeeDetail extends StatelessWidget {
  final EmployeeListModel employeeListModel;

  const EmployeeDetail({
    super.key,
    required this.employeeListModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('${employeeListModel.employeeName}')],
        ),
      ),
    );
  }
}
