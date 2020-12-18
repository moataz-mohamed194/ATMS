import 'package:ATMS/Widget/TextField.dart';
import 'package:ATMS/models/Validation.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'EditGet.dart';
import 'ValidationGet.dart';
class EmployeeGet extends GetxController{
  final controller = Get.put(ValidationGet());
  final controller0 = Get.put(EditGet());
  var data0;
  var data1;
  var data2;
  var data3;

  @override
  void onInit() {
    String dateFormat = DateFormat('dd/MM/yyyy').format(DateTime.now());

    data0= FirebaseDatabase.instance.reference().child("Accepted").child(dateFormat).orderByChild("department").equalTo("${controller0.department.value}");
    data1= FirebaseDatabase.instance.reference().child("Here").child(dateFormat).orderByChild("department").equalTo("${controller0.department.value}");
    data2= FirebaseDatabase.instance.reference().child("reject").child(dateFormat).orderByChild("department").equalTo("${controller0.department.value}");
    data3= FirebaseDatabase.instance.reference().child("Employee");

  }

  var dropdownValue ='Employee';
  List<String> less=['Employee','Head', 'Admin'];
  // void nameEmployeeValidation(String value){
  //   bool departmentValid = RegExp("([a-z])").hasMatch(value);
  //   if (departmentValid == true && value.length > 5) {
  //     nameEmployeeData = ValidationItem(value, null);
  //   } else {
  //     nameEmployeeData = ValidationItem(null, "Enter valid name");
  //   }
  //   update();
  // }
  // void idEmployeeValidation(String value){
  //   bool departmentValid = RegExp("([1-9])").hasMatch(value);
  //   if (departmentValid == true && value.length > 5) {
  //     idEmployeeData = ValidationItem(value, null);
  //   } else {
  //     idEmployeeData = ValidationItem(null, "Enter valid id");
  //   }
  //   update();
  // }
  // void passwordEmployeeValidation(String value){
  //   bool passwordValid0 = RegExp(r"[a-z]").hasMatch(value);
  //   bool passwordValid1 = RegExp(r"[A-Z]").hasMatch(value);
  //   bool passwordValid2 = RegExp(r"[0-9]").hasMatch(value);
  //   bool passwordValid3 = RegExp(r"[.!#$%&'*+-/=?^_`{|}~]").hasMatch(value);
  //
  //   if (passwordValid0 == true &&
  //       passwordValid1 == true &&
  //       passwordValid2 == true &&
  //       passwordValid3 == true && value.length > 8) {
  //     passwordEmployeeData = ValidationItem(value, null);
  //   } else {
  //     passwordEmployeeData = ValidationItem(null, "Enter valid password");
  //   }
  //   update();
  // }
  Future<void> addDepartment(BuildContext context,String department){
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Add Employee'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GetBuilder<ValidationGet>(
                    builder: (_) => TextFileLogin(
                      hintText: "Employee Name",
                      errorText: controller.nameEmployee.error,
                      cursorColor: Colors.grey,
                      borderSideColor: Colors.grey,
                      textStyleColor: Colors.grey,
                      textChange: (vals) {
                        controller.nameEmployeeValidation(vals);
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
                      hintText: "ID",
                      errorText: controller.idEmployee.error,
                      cursorColor: Colors.grey,
                      borderSideColor: Colors.grey,
                      textStyleColor: Colors.grey,
                      textChange: (vals) {
                        controller.idEmployeeValidation(vals);
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
                      hintText: "Password",
                      errorText: controller.passwordEmployee.error,
                      cursorColor: Colors.grey,
                      borderSideColor: Colors.grey,
                      textStyleColor: Colors.grey,
                      textChange: (vals) {
                        controller.passwordEmployeeValidation(vals);
                      },
                      inputType: TextInputType.name,
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GetBuilder<EmployeeGet>(
                    builder: (_) =>  DropdownButton<String>(
                      value: "$dropdownValue",
                      elevation: 16,

                      style: TextStyle(color: Colors.deepPurple),
                      onChanged: (String newValue) {
                        //setState(() {
                          print(newValue);
                        dropdownValue=newValue;
                        update();
                          //dropdownValue.update((val) { val=newValue;}); //= newValue as RxString;
                        //});
                      },
                      items: less
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  )
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
                controller.boolAddEmployee==true&&dropdownValue!=null?
                FirebaseDatabase.instance
                    .reference()
                    .child('Employee')
                    .child(controller.idEmployeeData.value).child(department)
                    .set({
                  'userName': controller.nameEmployeeData.value,
                  "position":dropdownValue,
                  "id":controller.idEmployeeData.value,
                  "img":"https://firebasestorage.googleapis.com/v0/b/atms-e3288.appspot.com/o/emty.webp?alt=media&token=e64a6d6d-7228-47e1-a00d-4448a7ff281e",
                  'password': controller.passwordEmployeeData.value
                }).whenComplete(()  {
                  updateCount(department);
                  Navigator.of(context).pop();
                }):print("error");



              },
            ),
          ],);
        });

  }
  Future<void> updateCount(String department) async {
    int count=(await FirebaseDatabase.instance
        .reference()
        .child('Department').child(department).once()).value["Count"]+1;
    print(count);
    //int count=event.snapshot.value["Count"]+1;
    FirebaseDatabase.instance
        .reference()
        .child('Department').child(department).update(
        {"Count": count});

  }

}