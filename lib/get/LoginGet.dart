import 'package:ATMS/Screens/Admin/Main_Screen_Admin.dart';
import 'package:ATMS/Screens/employee/Main_Screen_Employee.dart';
import 'package:ATMS/Screens/head/Main_Screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:toast/toast.dart';

import 'ValidationGet.dart';
class TextFieldGet extends GetxController {
  final values = GetStorage();
  final controller = Get.put(ValidationGet());

  void loginMethod(BuildContext context)async{

    Map data=(await FirebaseDatabase.instance.reference()
        .child('Employee').child(controller.idEmployee.value).once()).value;
    print(data.values.first);
    print("img:${data.values.first["img"]}");
    print("password:${data.values.first["password"]}");
    print("PhoneNumber:${data.values.first["PhoneNumber"]}");
    print("id:${data.values.first["id"]}");
    print("position:${data.values.first["position"]}");
    print("userName${data.values.first["userName"]}");
    print("department:${data.keys.first}");
if(controller.passwordEmployee.value==data.values.first["password"]){
  values.write('userName', '${data.values.first["userName"]}');
  values.write('ID', '${data.values.first["id"]}');
  values.write('Img', "${data.values.first["img"]}");
  values.write('password', '${data.values.first["password"]}');
  values.write('position', '${data.values.first["position"]}');
  values.write('department', '${data.keys.first}');
  values.write('PhoneNumber', '${data.values.first["PhoneNumber"]}');
  if(data.values.first["position"]=="Head"){
    Get.off(MainScreen());
    print("head");
  }else if (data.values.first["position"]=="Employee"){
    Get.off(MainScreenEmployee());
    print("employee");
  }else if(data.values.first["position"]=="Admin"){
    Get.off(MainScreenAdmin());
    print("admin");
  }

}else{
  print("error");
  Toast.show("Wrong password", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
}






  }
}