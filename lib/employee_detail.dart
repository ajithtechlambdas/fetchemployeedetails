import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      appBar: AppBar(title: Text('Employee Detail')),
      body: _buildBodyWidget(),
    );
  }

  _buildBodyWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTextWidget(
              text: 'Name: ${employeeListModel.employeeName}',
              fontSize: 22,
              fontWeight: FontWeight.w700),
          _buildTextWidget(
              text: 'City: ${employeeListModel.city}',
              fontSize: 18,
              fontWeight: FontWeight.w400),
          _buildTextWidget(
              text: 'Salary: ${employeeListModel.dailySalary}',
              fontSize: 18,
              fontWeight: FontWeight.w400),
        ],
      ),
    );
  }
  _buildTextWidget({String? text, double? fontSize, FontWeight? fontWeight}) {
    return Text(
      text!,
      style: GoogleFonts.poppins(fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}
