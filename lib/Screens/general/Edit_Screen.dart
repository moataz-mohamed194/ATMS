import 'package:ATMS/get/EditGet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class EditScreen extends StatelessWidget {
  final controller = Get.put(EditGet());

  @override
  Widget build(BuildContext context) {
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
                              child: GetBuilder<EditGet>(
                                builder: (_) => controller.imageFile == null
                                    ? Image.network(controller.img.value,
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
                  GetBuilder<EditGet>(
                      builder: (_) =>Text(
                    "PhoneNumber:${controller.phoneNumber.value}",
                    style: TextStyle(fontSize: 20),
                  )),
                  FlatButton(
                    child: Text(
                      "Edit",
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    onPressed: () {
                      controller.edit(context, "PhoneNumber", 0);

                      print("Edit ID");
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Password:${controller.password.value}\n ${controller.pass.value}",
                    style: TextStyle(fontSize: 20),
                  ),
                  FlatButton(
                    child: Text(
                      "Edit",
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    onPressed: () {
                      controller.edit(context, "Password", 1);

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
                    "UserName:${controller.name.value}",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    "ID:${controller.iD.value}",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    "Department:${controller.department.value}",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    "Status:${controller.position.value}",
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
