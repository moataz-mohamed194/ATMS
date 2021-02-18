import 'dart:async';
import 'package:ATMS/Screens/login/Login_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Introduction extends GetxController {
  void timer(BuildContext context) {
    Timer.periodic(Duration(seconds: 3), (timer) {
      print(timer);
      Get.off(LoginScreen());
      timer.cancel();
    });
  }
}
