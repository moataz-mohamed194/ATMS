import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'Screens/Admin/Main_Screen_Admin.dart';
import 'Screens/employee/Main_Screen_Employee.dart';
import 'Screens/head/Department_Screen.dart';
import 'Screens/head/Main_Screen.dart';
import 'Screens/login/Introduction_Screen.dart';
import 'Screens/login/Login_Screen.dart';
import 'Screens/head/Requests_Screen.dart';
import 'get/IntroductionGet.dart';

import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await firebase_core.Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ATMS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:LoginScreen()//MainScreenAdmin()
          /*MainScreen()  IntroScreen()  *EmployeeScree() /
          DepartmentScreen()  RequestScreen() LoginScreen(), IntroScreen()*/
      ,
    );
  }
}
