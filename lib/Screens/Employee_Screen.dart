import 'package:ATMS/Widget/RequestWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmployeeScree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.blue),
        ),
        body: Container(
            child: Column(
          children: [
            RequestWidget(
              image: 'images/ATMS View/download.jpeg',
              department: 'mobile department',
              id: '19821353486895432',
              userName: 'Moataz mohamed saad',
              i: 1,
              color: "r",
            ),
            RequestWidget(
              image: 'images/ATMS View/download.jpeg',
              department: 'mobile department',
              id: '19821353486895432',
              userName: 'Moataz mohamed saad',
              i: 1,
              color: "g",
            ),
            RequestWidget(
              image: 'images/ATMS View/download.jpeg',
              department: 'mobile department',
              id: '19821353486895432',
              userName: 'Moataz mohamed saad',
              i: 1,
              color: "y",
            ),
            RequestWidget(
              image: 'images/ATMS View/download.jpeg',
              department: 'mobile department',
              id: '19821353486895432',
              userName: 'Moataz mohamed saad',
              i: 1,
              color: "b",
            ),
            RequestWidget(
              image: 'images/ATMS View/download.jpeg',
              department: 'mobile department',
              id: '19821353486895432',
              userName: 'Moataz mohamed saad',
              i: 1,
              color: "g",
            ),
          ],
        )),
      ),
    );
  }
}
