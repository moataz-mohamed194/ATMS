import 'dart:async';

import 'package:ATMS/Screens/Login_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';

class Introduction extends GetxController {
  void timer(BuildContext context) {
    Timer.periodic(Duration(seconds: 3), (timer) {
      print(timer);
//      Navigator.push(
//        context,
//        MaterialPageRoute(
//            builder: (context) => MyHomePage(title: 'Flutter Demo Home Page')),
//      );

//      Navigator.of(context).push(context,
//          MaterialPageRoute(context, builder: (context){
//        return Second();
//      },
//      );
      Get.off(LoginScreen());
      timer.cancel();
    });
  }
}
