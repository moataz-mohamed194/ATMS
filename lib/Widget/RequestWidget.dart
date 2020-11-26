import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  final department;
  final i;

  RequestWidget(
      {Key key,
      this.userName,
      this.id,
      this.image,
      this.department,
      this.i,
      this.color})
      : super(key: key);

  Widget _selectPopup() => PopupMenuButton<int>(
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
          } else if (value == 2) {
            print("remove $value");
          }
        },
        icon: Icon(Icons.more_vert),
      );
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Container(
        height: 117,
        width: MediaQuery.of(context).size.width - 24,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Image.asset(image),
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
            i == 0
                ? Container(
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
                          onPressed: () {
                            print("accepted $id");
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            print("reject $id");
                          },
                        )
                      ],
                    ),
                  )
                : Container(),
            i == 1
                ? Column(
                    children: [
                      _selectPopup(),
                      // PopupMenuButton<CustomPopupMenu>(
                      //   child: Icon(
                      //     Icons.more_vert,
                      //   ),
                      //   elevation: 3.2,
                      //   onCanceled: () {
                      //     print('You have not chossed anything');
                      //   },
                      //   tooltip: 'This is tooltip',
                      //   // onSelected: 0,
                      //   itemBuilder: (BuildContext context) {
                      //     return choices.map((CustomPopupMenu choice) {
                      //       return PopupMenuItem<CustomPopupMenu>(
                      //         value: choice,
                      //         child: Text(choice.title),
                      //       );
                      //     }).toList();
                      //   },
                      // ),
                      /*Container(
                        child: IconButton(
                            icon: Icon(Icons.more_vert),
                            onPressed: () {
                              print("menu");
                            }),
                        margin: EdgeInsets.only(right: 10, top: 10),
                      ),*/
                      CustomPaint(
                        painter: OpenPainter(color),
                      ),
                    ],
                  )
                : Container(),
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
