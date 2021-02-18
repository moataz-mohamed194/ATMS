import 'package:ATMS/Screens/general/Employee_Screen.dart';
import 'package:ATMS/Widget/DepartmentWidget.dart';
import 'package:ATMS/get/DepartmentGet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


class DepartmentScreen extends StatelessWidget {
  final controller = Get.put(DepartmentGet());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              StreamBuilder(
                stream: controller.data.onValue,
                builder: (context, snap) {
                  if (snap.hasData &&
                      !snap.hasError &&
                      snap.data.snapshot.value != null) {
                    Map data = snap.data.snapshot.value;
                    List item = [];
                    data.forEach(
                            (index, data) => item.add({"key": index, ...data}));
                    return Expanded(
                        child: SizedBox(
                            child: ListView.builder(
                              itemCount: item.length,
                              itemBuilder: (context, index) {
                                return
                                  GetBuilder<DepartmentGet>(
                                    builder: (_) => DepartmentWidget(
                                      name: item[index]['Name'],
                                      count: "${item[index]['Count']}",
                                      description: item[index]['Description'],
                                      action: () {
                                        Get.to(EmployeeScreen(head: true,department: item[index]['Name']));
                                      },
                                      removeAction:(){
                                        controller.removeDepartment(item[index]['Name']);
                                      } ,
                                    ),
                                  );
                              },
                            )));
                  } else
                    return Text("No data");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
