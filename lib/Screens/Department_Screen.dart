import 'package:ATMS/Widget/DepartmentWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'Employee_Screen.dart';

class DepartmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              DepartmentWidget(
                name: "Mobile Department",
                count: "Count of employee in it",
                description: "Description",
                action: () {
                  Get.to(EmployeeScree());
                },
              ),
              DepartmentWidget(
                name: "Mobile Department",
                count: "Count of employee in it",
                description: "Description",
                action: () {
                  print("fi");
                },
              ),
              DepartmentWidget(
                name: "Mobile Department",
                count: "Count of employee in it",
                description: "Description",
                action: () {
                  print("first");
                },
              ),
              DepartmentWidget(
                name: "Mobile Department",
                count: "Count of employee in it",
                description: "Description",
                action: () {
                  print("second");
                },
              ),
              DepartmentWidget(
                name: "Mobile Department",
                count: "Count of employee in it",
                description: "Description",
                action: () {
                  print("third");
                },
              ),
              DepartmentWidget(
                name: "Mobile Department",
                count: "Count of employee in it",
                description: "Description",
                action: () {
                  print("fourth");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
