// To parse this JSON data, do
//
//     final employeeListModel = employeeListModelFromJson(jsonString);

import 'dart:convert';

List<EmployeeListModel> employeeListModelFromJson(String str) => List<EmployeeListModel>.from(json.decode(str).map((x) => EmployeeListModel.fromJson(x)));

String employeeListModelToJson(List<EmployeeListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmployeeListModel {
  bool? active;
  String? address;
  String? city;
  DateTime? createdDateTime;
  double? dailySalary;
  String? employeeId;
  String? employeeName;
  String? mobileNumber;
  DateTime? updatedDateTime;
  String? workType;

  EmployeeListModel({
    this.active,
    this.address,
    this.city,
    this.createdDateTime,
    this.dailySalary,
    this.employeeId,
    this.employeeName,
    this.mobileNumber,
    this.updatedDateTime,
    this.workType,
  });

  factory EmployeeListModel.fromJson(Map<String, dynamic> json) => EmployeeListModel(
    active: json["active"],
    address: json["address"],
    city: json["city"],
    createdDateTime: json["createdDateTime"] == null ? null : DateTime.parse(json["createdDateTime"]),
    dailySalary: json["dailySalary"],
    employeeId: json["employeeId"],
    employeeName: json["employeeName"],
    mobileNumber: json["mobileNumber"],
    updatedDateTime: json["updatedDateTime"] == null ? null : DateTime.parse(json["updatedDateTime"]),
    workType: json["workType"],
  );

  Map<String, dynamic> toJson() => {
    "active": active,
    "address": address,
    "city": city,
    "createdDateTime": createdDateTime?.toIso8601String(),
    "dailySalary": dailySalary,
    "employeeId": employeeId,
    "employeeName": employeeName,
    "mobileNumber": mobileNumber,
    "updatedDateTime": updatedDateTime?.toIso8601String(),
    "workType": workType,
  };
}
