import 'dart:ui';

import 'package:ATMS/get/EmployeeGet.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CustomPopupMenu {
  CustomPopupMenu({
    this.title,
    this.icon,
  });
  String title;
  IconData icon;
}

class RequestWidget extends StatelessWidget {
  final userName;
  final id;
  final image;
  final color;
  final password;
  final department;
  final position;
  final reason;
  final i;

  RequestWidget(
      {Key key,
      this.userName,
      this.id,
      this.image,
        this.password,
        this.position,
      this.department,
        this.reason,
      this.i,
      this.color})
      : super(key: key);
  final controller = Get.put(EmployeeGet());

  Widget _selectPopup(BuildContext context) => PopupMenuButton<int>(
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 1,
            child: Text("Edit"),
          ),
          PopupMenuItem(
            value: 2,
            child: Text("Refusal"),
          ),
        ],
        onCanceled: () {
          print("You have canceled the menu.");
        },
        onSelected: (value) {
          if (value == 1) {
            controller.editDepartment(context,id,department,position,image,userName,password);
          } else if (value == 2) {
            controller.refusalEmployee(id,department);
          }
        },
        icon: Icon(Icons.more_vert),
      );
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 117,
        width: MediaQuery.of(context).size.width - 24,
        child:
        i==0?Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Image.network(image),
                  Container(
                    margin: EdgeInsets.only(top: 23, bottom: 23, left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(userName),
                        Text(department),
                        Text(reason),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
                    margin: EdgeInsets.only(right: 27),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                          onPressed: () async {
                            String dateFormat = DateFormat('dd/MM/yyyy').format(DateTime.now());

                            await FirebaseDatabase.instance
                                .reference()
                                .child('Accepted')
                                .child(dateFormat).child(id)
                                .set({
                              'userName': userName,
                              "department":department,
                              "id":id,
                              "img":image
                            }).whenComplete(()  {
                              FirebaseDatabase.instance
                                  .reference()
                                  .child('requests')
                                  .child(dateFormat).child(id).remove();
                              FirebaseDatabase.instance
                                  .reference()
                                  .child('Here')
                                  .child(dateFormat).child(id).remove();

                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: Colors.red,
                          ),
                          onPressed: () async {
                            String dateFormat = DateFormat('dd/MM/yyyy').format(DateTime.now());

                            await FirebaseDatabase.instance
                                .reference()
                                .child('reject')
                                .child(dateFormat).child(id)
                                .set({
                              'userName': userName,
                              "department":department,
                              "id":id,
                              "img":image
                            }).whenComplete(()  {
                              FirebaseDatabase.instance
                                  .reference()
                                  .child('requests')
                                  .child(dateFormat).child(id).remove();

                            });
                          },
                        )
                      ],
                    ),
                  )
            ],
        ):Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Image.network(image),
                  Container(
                    margin: EdgeInsets.only(top: 23, bottom: 23, left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(userName),
                        Text(id),
                        Text(department),
                      ],
                    ),
                  ),
                ],
              ),
            ),
             Column(
              children: [
                _selectPopup(context),
                CustomPaint(
                  painter: OpenPainter(color),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class OpenPainter extends CustomPainter {
  final color;

  OpenPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    var paint1;
    if (color == "g") {
      paint1 = Paint()
        ..color = Colors.green // Color(0xff63aa65)
        ..strokeCap = StrokeCap.round //rounded points
        ..strokeWidth = 10;
    } else if (color == "r") {
      paint1 = Paint()
        ..color = Colors.red // Color(0xff63aa65)
        ..strokeCap = StrokeCap.round //rounded points
        ..strokeWidth = 10;
    } else if (color == "b") {
      paint1 = Paint()
        ..color = Colors.blue // Color(0xff63aa65)
        ..strokeCap = StrokeCap.round //rounded points
        ..strokeWidth = 10;
    } else if (color == "y") {
      paint1 = Paint()
        ..color = Colors.yellow // Color(0xff63aa65)
        ..strokeCap = StrokeCap.round //rounded points
        ..strokeWidth = 10;
    }
    //list of points
    var points = [
      Offset(-5, 35),
    ];
    //draw points on canvas
    canvas.drawPoints(PointMode.points, points, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
