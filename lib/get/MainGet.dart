import 'package:ATMS/Widget/TextField.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'EditGet.dart';
import 'ValidationGet.dart';

class MainGet extends GetxController{
  final controller0 = Get.put(ValidationGet());
  final controller1 = Get.put(EditGet());
  Future<void> showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Data'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GetBuilder<ValidationGet>(
                  builder: (_) =>TextFileLogin(
                    hintText: "Reason to leave",
                    errorText: controller0.reason.error,
                    cursorColor: Colors.grey,
                    borderSideColor: Colors.grey,
                    textStyleColor: Colors.grey,
                    textChange: (vals) {
                      controller0.reasonValidation(vals);
                      //   validationService.changePhoneNumber(vals);
                    },
                    inputType: TextInputType.name,
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('send'),
              onPressed: () {
                controller0.sendReason==true?sendReason(context)
                    :print("error");
              },
            ),
          ],
        );
      },
    );
  }

  void sendReason(BuildContext context){
    String dateFormat = DateFormat('dd/MM/yyyy').format(DateTime.now());
    FirebaseDatabase.instance
        .reference().child("requests").child(dateFormat).child(controller1.iD.value).set({
      "name":controller1.name.value,
      "img":controller1.img.value,
      "department":controller1.department.value,
      "reason":controller0.reason.value,

    })
.whenComplete(() {
      Navigator.of(context).pop();

    });    print("${controller1.name.value} \n - ${controller1.img.value} \n -${controller1.department.value} \n -${controller0.reason.value}");

  }
}