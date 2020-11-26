import 'package:ATMS/Widget/RequestWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RequestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: RequestWidget(
            image: 'images/ATMS View/download.jpeg',
            department: 'mobile department',
            id: '19821353486895432',
            userName: 'Moataz mohamed saad',
            i: 0,
          ),
        ),
      ),
    );
  }
}
