import 'package:ATMS/Widget/Button.dart';
import 'package:ATMS/Widget/TextField.dart';
import 'package:ATMS/get/LoginGet.dart';
import 'package:ATMS/get/ValidationGet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final controller = Get.put(ValidationGet());
  final controller0 = Get.put(TextFieldGet());

  @override
  Widget build(BuildContext context) {
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
                  GetBuilder<ValidationGet>(
                    builder: (_) => TextFileLogin(
                      hintText: "User ID",
                      errorText: controller.idEmployee.error,
                      cursorColor: Colors.grey,
                      borderSideColor: Colors.grey,
                      textStyleColor: Colors.grey,
                      textChange: (vals) {
                          controller.idEmployeeValidation(vals,false);
                      },
                      inputType: TextInputType.number,
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  GetBuilder<ValidationGet>(
                    builder: (_) =>  TextFileLogin(
                      hintText: "Password",
                      errorText: controller.passwordEmployee.error,
                      cursorColor: Colors.grey,
                      borderSideColor: Colors.grey,
                      textStyleColor: Colors.grey,
                      textChange: (vals) {
                           controller.passwordEmployeeValidation(vals);
                      },
                      obscure: true,
                      inputType: TextInputType.text,
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
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
                            controller0.loginMethod(context);
                      }),
                ],
              )),
        ),
      ),
    );
  }
}
