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
      : /* assert(head==true),assert(department=="dd"),*/ super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller0 = Get.put(EditGet());

    // TODO: implement build
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
                      print("add");
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
                                print(item);
                                ids.add(item[index]['key']);
                                return GetBuilder<EmployeeGet>(
                                    builder: (_) => RequestWidget(

                                      image:item[index]['img'],
                                      //'images/ATMS View/download.jpeg',
                                      department:item[index]['department'],
                                      //'mobile department',
                                      id: item[index]['key'],//'19821353486895432',
                                      userName: item[index]['userName'],
                                      //'Moataz mohamed saad',
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
                                print(item);

                                ids.add(item[index]['key']);
                                return GetBuilder<EmployeeGet>(
                                    builder: (_) => RequestWidget(

                                      image:"${item[index]['Img']}",
                                      //'images/ATMS View/download.jpeg',
                                      department:"${item[index]['department']}",
                                      //'mobile department',
                                      id: "${item[index]['key']}",//'19821353486895432',
                                      userName: "${item[index]['name']}",
                                      //'Moataz mohamed saad',
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
            // StreamBuilder(
            //     stream: controller.data2.onValue,
            //     builder: (context, snap) {
            //       if (snap.hasData &&
            //           !snap.hasError &&
            //           snap.data.snapshot.value != null) {
            //         Map data = snap.data.snapshot.value;
            //         List item = [];
            //         data.forEach(
            //                 (index, data) => item.add({"key": index, ...data}));
            //         return Expanded(
            //             child: SizedBox(
            //                 child:ListView.builder(
            //                   itemCount: item.length,
            //                   itemBuilder: (context, index) {
            //                     print(item);
            //
            //                     ids.add(item[index]['key']);
            //                     return GetBuilder<EmployeeGet>(
            //                         builder: (_) => RequestWidget(
            //
            //                           image:"${item[index]['img']}",
            //                           //'images/ATMS View/download.jpeg',
            //                           department:"${item[index]['department']}",
            //                           //'mobile department',
            //                           id: "${item[index]['key']}",//'19821353486895432',
            //                           userName: "${item[index]['userName']}",
            //                           //'Moataz mohamed saad',
            //                           reason: "",
            //                           i: 1,
            //                           color: "y",
            //                         ));
            //                   },
            //                 )));
            //       }else{
            //         return Container();
            //       }
            //     }),
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
                                print("${item[index].keys.last} == ${controller0.department.value}");
                                if (item[index].keys.last == controller0.department.value&&!ids.contains(x.last['id'])) {
                                  print("qq:$x");
                                  return GetBuilder<EmployeeGet>(
                                      builder: (_) => RequestWidget(
                                        image: "${x.last['img']}",
                                        department: "${item[index].keys.last}",
                                        id: "${x.last['id']}", //'19821353486895432',
                                        userName: "${x.last['userName']}",
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
                                            id: "${x.last['id']}", //'19821353486895432',
                                            userName: "${x.last['userName']}",
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
