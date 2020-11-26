import 'package:ATMS/Widget/Button.dart';
import 'package:ATMS/Widget/TextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Main_Screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    child: Image.asset('images/logos/LOGO.png'),
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 6.336633663,
                        bottom:
                            MediaQuery.of(context).size.height / 6.274509804),
                  ),
                  TextFileLogin(
                    hintText: "User ID",
                    //errorText: validationService.phoneNumber.error,
                    cursorColor: Colors.grey,
                    borderSideColor: Colors.grey,
                    textStyleColor: Colors.grey,
                    textChange: (vals) {
                      //   validationService.changePhoneNumber(vals);
                    },
                    inputType: TextInputType.number,
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  TextFileLogin(
                    hintText: "Password",
                    //errorText: validationService.phoneNumber.error,
                    cursorColor: Colors.grey,
                    borderSideColor: Colors.grey,
                    textStyleColor: Colors.grey,
                    textChange: (vals) {
                      //   validationService.changePhoneNumber(vals);
                    },
                    obscure: true,
                    inputType: TextInputType.text,
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 44,
                  ),
                  ButtonWidget(
                      height: 50,
                      color: Colors.grey,
                      text: "LOGIN",
                      borderColor: Colors.grey,
                      textColor: Colors.white,
                      onPressed: () async {
                        Get.off(MainScreen());
//                (!validationService.signInIsValid)
//                    ? addService.alert(context)
//                    : addService.loginNext(
//                    context,
//                    validationService.phoneNumberData.value,
//                    validationService.passwordData.value);
                        print("FFFFFFFFff");
                      }),
                ],
              )),
        ),
      ),
    );
  }
}
