import 'package:ATMS/Screens/Admin/Main_Screen_Admin.dart';
import 'package:ATMS/Screens/employee/Main_Screen_Employee.dart';
import 'package:ATMS/Screens/head/Main_Screen.dart';
import 'package:ATMS/models/Validation.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:toast/toast.dart';

import 'ValidationGet.dart';
class TextFieldGet extends GetxController {
  // ValidationItem idData = new ValidationItem(null, null);
  // ValidationItem passwordData = new ValidationItem(null, null);
  // ValidationItem get id => idData;
  // ValidationItem get password => passwordData;
  final values = GetStorage();
  final controller = Get.put(ValidationGet());

  void loginMethod(BuildContext context)async{

    Map data=(await FirebaseDatabase.instance.reference()
        .child('Employee').child(controller.idEmployee.value).once()).value;
    print("img:${data.values.single["img"]}");
    print("password:${data.values.single["password"]}");
    print("PhoneNumber:${data.values.single["PhoneNumber"]}");
    print("id:${data.values.single["id"]}");
    print("position:${data.values.single["position"]}");
    print("userName${data.values.single["userName"]}");
    print("department:${data.keys.first}");
if(controller.passwordEmployee.value==data.values.single["password"]){
  values.write('userName', '${data.values.single["userName"]}');
  values.write('ID', '${data.values.single["id"]}');
  values.write('Img', "${data.values.single["img"]}");
  values.write('password', '${data.values.single["password"]}');
  values.write('position', '${data.values.single["position"]}');
  values.write('department', '${data.keys.first}');
  values.write('PhoneNumber', '${data.values.single["PhoneNumber"]}');
  if(data.values.single["position"]=="Head"){
    Get.off(MainScreen());
    print("head");
  }else if (data.values.single["position"]=="Employee"){
    Get.off(MainScreenEmployee());
    print("employee");
  }else if(data.values.single["position"]=="Admin"){
    Get.off(MainScreenAdmin());
    print("admin");
  }

}else{
  print("error");
  Toast.show("Wrong password", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);

}
    // values.write('userName', '${data.values.single["userName"]}');
    // values.write('ID', '${data.values.single["id"]}');
    // values.write('Img', "${data.values.single["img"]}");
    // values.write('password', '${data.values.single["password"]}');
    // values.write('position', '${data.values.single["position"]}');
    // values.write('department', '${data.keys.first}');
    // values.write('PhoneNumber', '${data.values.single["PhoneNumber"]}');
    //Get.off(MainScreen());

  }
}