import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Screens/Department_Screen.dart';
import 'Screens/Main_Screen.dart';
import 'Screens/Employee_Screen.dart';
import 'Screens/Introduction_Screen.dart';
import 'Screens/Login_Screen.dart';
import 'Screens/Requests_Screen.dart';
import 'get/IntroductionGet.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ATMS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:
          /*MainScreen() */ IntroScreen() /* EmployeeScree() /
          DepartmentScreen()  RequestScreen() LoginScreen(), IntroScreen()*/
      ,
    );
  }
}
