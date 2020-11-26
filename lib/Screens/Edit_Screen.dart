import 'package:ATMS/get/EditGet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class EditScreen extends StatelessWidget {
  final controller = Get.put(Edit());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  height: 130,
                  width: 200,
                  alignment: Alignment.center,
                  child: InkWell(
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).accentColor,
                            ),
                            height: 120,
                            width: 120,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(120)),
                              child: GetBuilder<Edit>(
                                builder: (_) => controller.imageFile == null
                                    ? Image.asset(
                                        'images/ATMS View/download.jpeg',
                                        height: 120,
                                        width: 120,
                                      )
                                    : Image.file(
                                        controller.imageFile,
                                        height: 120,
                                        width: 120,
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      controller.onChoseImage(context);
                    },
                  )),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 12, bottom: 22),
                child: InkWell(
                  child: Text(
                    "Add Image",
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                  onTap: () {
                    controller.onChoseImage(context);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "UserName",
                    style: TextStyle(fontSize: 20),
                  ),
                  FlatButton(
                    child: Text(
                      "Edit",
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    onPressed: () {
                      controller.editUserName(context, "UserName", 0);
                      print("Edit username");
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "UserName",
                    style: TextStyle(fontSize: 20),
                  ),
                  FlatButton(
                    child: Text(
                      "Edit",
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    onPressed: () {
                      controller.editUserName(context, "ID", 0);

                      print("Edit ID");
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Password",
                    style: TextStyle(fontSize: 20),
                  ),
                  FlatButton(
                    child: Text(
                      "Edit",
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    onPressed: () {
                      controller.editUserName(context, "Password", 1);

                      print("Edit Password");
                    },
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    "Email@example",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    "Status(head,admin)",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
