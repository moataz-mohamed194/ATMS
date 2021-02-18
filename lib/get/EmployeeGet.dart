import 'package:ATMS/Widget/TextField.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'EditGet.dart';
import 'ValidationGet.dart';

class EmployeeGet extends GetxController {
  final controller = Get.put(ValidationGet());
  final controller0 = Get.put(EditGet());
  var data0;
  var data1;
  var data2;
  var data3;
  @override
  Future<void> onInit() async {
    super.onInit();
    String dateFormat = DateFormat('dd/MM/yyyy').format(DateTime.now());
    data0 = FirebaseDatabase.instance
        .reference()
        .child("Accepted")
        .child(dateFormat)
        .orderByChild("department")
        .equalTo("${controller0.department.value}");
    data1 = FirebaseDatabase.instance
        .reference()
        .child("Here")
        .child(dateFormat)
        .orderByChild("department")
        .equalTo("${controller0.department.value}");
    data2 = FirebaseDatabase.instance
        .reference()
        .child("reject")
        .child(dateFormat)
        .orderByChild("department")
        .equalTo("${controller0.department.value}");
    data3 = FirebaseDatabase.instance.reference().child("Employee");
  }

  var dropdownValue = 'Employee';
  var dropdownValue1 = 'Lollipops';
  List<String> positions = ['Employee', 'Head', 'Admin'];
  Future<void> addDepartment(BuildContext context, String department) {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
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
                        controller.idEmployeeValidation(vals, true);
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
                    builder: (_) => DropdownButton<String>(
                      value: "$dropdownValue",
                      elevation: 16,
                      style: TextStyle(color: Colors.deepPurple),
                      onChanged: (String newValue) {
                        dropdownValue = newValue;
                        update();
                      },
                      items: positions.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  )
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
                child: Text('Add'),
                onPressed: () {
                  controller.boolAddEmployee == true && dropdownValue != null
                      ?addEmployee(context,controller.idEmployeeData.value,department,dropdownValue,"https://firebasestorage.googleapis.com/v0/b/atms-e3288.appspot.com/o/emty.webp?alt=media&token=e64a6d6d-7228-47e1-a00d-4448a7ff281e",controller.nameEmployeeData.value,controller.passwordEmployeeData.value)
                      : print("error");
                },
              ),
            ],
          );
        });
  }

  Future<void> addEmployee( BuildContext context,String id, String department, String position,String image,String userName,String password) async {
    await FirebaseDatabase.instance
        .reference()
        .child('Employee')
        .child(id)
        .child(department)
        .set({
      'userName': userName,
      "position": position,
      "id": id,
      "img":
      image,
      'password': password
    }).whenComplete(() {
      updateCount(department, "increase");
      Navigator.of(context).pop();
    });
  }


  Future<void> updateCount(String department, String state) async {
    int count = (await FirebaseDatabase.instance
            .reference()
            .child('Department')
            .child(department)
            .once())
        .value["Count"];
    if (state == "increase") {

      print("updateCount: $department:$count");
      count = count + 1;
      FirebaseDatabase.instance
          .reference()
          .child('Department')
          .child(department)
          .update({"Count": count});
      print("updateCount0000: $department:$count");
    } else {

      print("updateCount: $department:$count");
      count = count - 1;
      FirebaseDatabase.instance
          .reference()
          .child('Department')
          .child(department)
          .update({"Count": count});

      print("updateCount000: $department:$count");
    }
  }

  Future<void> refusalEmployee(String id, String department) async {
    print("refusalEmployee: $id + $department");
    await FirebaseDatabase.instance
        .reference()
        .child('Employee')
        .child(id)
        .remove()
        .whenComplete(() => updateCount(department, "decrease"));
  }

  Future<void> editDepartment(
      BuildContext context, String id, String department, String position,String image,String userName,String password) {
    dropdownValue1=department;
    dropdownValue=position;
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Edit Employee'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text("Position"),
                  GetBuilder<EmployeeGet>(
                    builder: (_) => DropdownButton<String>(
                      value: "$dropdownValue",
                      elevation: 16,
                      style: TextStyle(color: Colors.black),
                      onChanged: (String newValue) {
                        dropdownValue = newValue;
                        update();
                      },
                      items: positions.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Department"),
                  StreamBuilder<dynamic>(
                      stream: FirebaseDatabase.instance
                          .reference()
                          .child('Department')
                          .onValue,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData)
                          return Center(
                            child: CupertinoActivityIndicator(),
                          );
                        var data = snapshot.data.snapshot.value;
                        List<String> departments = data.keys.toList().cast<String>();
                        return DropdownButtonFormField<String>(
                          value: "$dropdownValue1",
                          elevation: 16,
                          style: TextStyle(color: Colors.black),
                          onChanged: (String newValue0) {
                            dropdownValue1 = newValue0;
                            update();
                          },
                          items: departments
                              .map<DropdownMenuItem<String>>((String value0) {
                            return DropdownMenuItem<String>(
                              value: value0,
                              child: Text(value0),
                            );
                          }).toList(),
                        );
                      })
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
                  child: Text('Edit'),
                  onPressed: () {
                    if (dropdownValue1!=department){

                      print("will create new node with that data and delete the old");
                      refusalEmployee( id,  department);
                      addEmployee(context,id,dropdownValue1,dropdownValue,image,userName,password);

                    }else {
                      print("only edit the position: $dropdownValue");
                      FirebaseDatabase.instance
                          .reference()
                          .child('Employee')
                          .child(id)
                          .child(department)
                          .update({
                        "position": dropdownValue,
                      }).printError();
                    }
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }
}
