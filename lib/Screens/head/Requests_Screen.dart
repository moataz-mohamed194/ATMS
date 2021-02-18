import 'package:ATMS/Widget/RequestWidget.dart';
import 'package:ATMS/get/RequestGet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RequestScreen extends StatelessWidget {
  final controller = Get.put(RequestGet());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        body: Container(
            child: StreamBuilder(
                stream: controller.data.onValue,
                builder: (context, snap) {
                  if (snap.hasData &&
                      !snap.hasError &&
                      snap.data.snapshot.value != null) {
                    Map data = snap.data.snapshot.value;
                    List item = [];
                    data.forEach(
                        (index, data) => item.add({"key": index, ...data}));
                    return ListView.builder(
                        itemCount: item.length,
                        itemBuilder: (context, index) {
                          print(item[index]);
                          if (item[index]['department'] ==
                              controller.department.value) {
                            return GetBuilder<RequestGet>(
                                builder: (_) => RequestWidget(
                                      image: item[index]['img'],
                                      department: item[index]['department'],
                                      id: item[index]['key'],
                                      userName: item[index]['name'],
                                      //reason: item[index]['key'],
                                      reason: item[index]['reason'],
                                      i: 0,
                                    ));
                          } else {
                            return Container();
                          }
                        });
                  } else {
                    return Container();
                  }
                })),
      ),
    );
  }
}
