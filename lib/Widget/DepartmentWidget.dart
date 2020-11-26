import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DepartmentWidget extends StatelessWidget {
  final name;
  final count;
  final description;
  final action;

  const DepartmentWidget(
      {Key key, this.name, this.count, this.description, this.action})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {
        print("Department");
        action();
      },
      child: Card(
        child: Container(
          width: MediaQuery.of(context).size.width - 24,
          margin: EdgeInsets.only(bottom: 20),
          // height: 100, //MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 33),
                    ),
                    IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          print("remove");
                        })
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      count,
                      style: TextStyle(fontSize: 17),
                    ),
                    Text(
                      description,
                      style: TextStyle(fontSize: 17),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
