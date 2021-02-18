import 'package:ATMS/Widget/RequestWidget.dart';
import 'package:ATMS/get/EditGet.dart';
import 'package:ATMS/get/EmployeeGet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeScreen extends StatelessWidget {
  final bool head;
  final String department;
  const EmployeeScreen({Key key, this.head, this.department})
      :  super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller0 = Get.put(EditGet());

    var controller = Get.put(EmployeeGet());
  List ids=[];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.blue),
          actions: [
            head == true
                ? IconButton(
                    icon: const Icon(Icons.add_outlined),
                    onPressed: () {
                      controller.addDepartment(context, department);
                    },
                  )
                : Container(),
          ],
        ),
        body: Container(
            child: head==false? Column(
          children: [
            StreamBuilder(
                stream: controller.data0.onValue,
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
                            child:ListView.builder(
                              itemCount: item.length,
                              itemBuilder: (context, index) {
                                ids.add(item[index]['key']);
                                return GetBuilder<EmployeeGet>(
                                    builder: (_) => RequestWidget(
                                      image:item[index]['img'],
                                      department:item[index]['department'],
                                      id: item[index]['key'],
                                      userName: item[index]['userName'],
                                      password:item[index]['password'],
                                      position: item[index]['position'],
                                      i: 1,
                                      color: "b",
                                    ));
                              },
                            )));
                  }else{
                    return Container();
                  }
                }),
            StreamBuilder(
                stream: controller.data1.onValue,
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
                            child:ListView.builder(
                              itemCount: item.length,
                              itemBuilder: (context, index) {

                                ids.add(item[index]['key']);
                                return GetBuilder<EmployeeGet>(
                                    builder: (_) => RequestWidget(

                                      image:"${item[index]['Img']}",
                                      department:"${item[index]['department']}",
                                      position: item[index]['position'],
                                      id: "${item[index]['key']}",
                                      password:item[index]['password'],
                                      userName: "${item[index]['name']}",
                                      reason: "",
                                      i: 1,
                                      color: "g",
                                    ));
                              },
                            )));
                  }else{
                    return Container();
                  }
                }),
            StreamBuilder(
                stream: controller.data3.onValue,
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
                                Iterable x = item[index].values;

                                if (item[index].keys.last == controller0.department.value&&!ids.contains(x.last['id'])) {
                                  return GetBuilder<EmployeeGet>(
                                      builder: (_) => RequestWidget(
                                        image: "${x.last['img']}",
                                        department: "${item[index].keys.last}",
                                        id: "${x.last['id']}",
                                        userName: "${x.last['userName']}",
                                        password:x.last['password'],
                                        position: x.last['position'],
                                        i: 1,
                                        color: "r",
                                      ));
                                } else {
                                  return Container();
                                }
                              },
                            )));
                  } else {
                    return Container();
                  }
                }),

          ],
        ) :Column(
              children: [
                StreamBuilder(
                    stream: controller.data3.onValue,
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
                                    Iterable x = item[index].values;
                                    if (item[index].keys.last == department) {

                                      return GetBuilder<EmployeeGet>(
                                          builder: (_) => RequestWidget(
                                            image: "${x.last['img']}",
                                            department: "${item[index].keys.last}",
                                            id: "${x.last['id']}",
                                            userName: "${x.last['userName']}",
                                            password:x.last['password'],
                                            position: x.last['position'],
                                            i: 1,
                                            color: "b",
                                          ));
                                    } else {
                                      return Container();
                                    }
                                  },
                                )));
                      } else {
                        return Container();
                      }
                    }),

              ],
            )
            ),
      ),
    );
  }
}
