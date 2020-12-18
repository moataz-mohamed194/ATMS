import 'package:ATMS/Widget/TextField.dart';
import 'package:ATMS/models/Validation.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ValidationGet.dart';
class DepartmentGet extends GetxController{
  final controller = Get.put(ValidationGet());

  Future<void> addDepartment(BuildContext context,){
    return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
          title: Text('Add Department'),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            GetBuilder<ValidationGet>(
        builder: (_) => TextFileLogin(
                hintText: "Department Name",
                errorText: controller.nameDepartment.error,
                cursorColor: Colors.grey,
                borderSideColor: Colors.grey,
                textStyleColor: Colors.grey,
                textChange: (vals) {
                  controller.nameDepartmentValidation(vals);
                  //   validationService.changePhoneNumber(vals);
                },
                inputType: TextInputType.name,
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GetBuilder<ValidationGet>(
              builder: (_) => TextFileLogin(
                hintText: "Description",
                errorText: controller.descriptionDepartment.error,
                cursorColor: Colors.grey,
                borderSideColor: Colors.grey,
                textStyleColor: Colors.grey,
                textChange: (vals) {
                  controller.descriptionDepartmentValidation(vals);
                  //   validationService.changePhoneNumber(vals);
                },
                inputType: TextInputType.name,
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),actions: <Widget>[
        FlatButton(
          child: Text('cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text('Add'),
          onPressed: () {
            print("Send request");
            controller.boolAddDepartment==true?

            FirebaseDatabase.instance
                .reference()
                .child('Department')
                .child(controller.nameDepartmentData.value)
                .set({
              'Name': controller.nameDepartmentData.value,

              "Count":0,
              'Description': controller.descriptionDepartmentData.value
            }).whenComplete(() => Navigator.of(context).pop()):print("Error");

          },
        ),
      ],);
    });

    }

  var data;
    @override
  Future<void> onInit() async {
      data= FirebaseDatabase.instance.reference().child("Department");
    }
    void removeDepartment(String path){
      FirebaseDatabase.instance.reference().child("Department").child(path).remove();
    }
}