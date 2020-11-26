import 'package:ATMS/Screens/Choose_Image_screen.dart';
import 'package:ATMS/Widget/TextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Edit extends GetxController {
  onChoseImage(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ChooseImage();
        });
  }

  var imageFile;

  //open camera to take pic
  Future<void> openCamera(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    imageFile = picture;
    print("0000000000" + "$picture");
    print(imageFile);
    update();
  }

  //open gallery to choose between pics in gallery
  Future<void> openGallery(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    imageFile = picture;
    update();
  }

  Future<void> editUserName(BuildContext context, String node, int i) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Data'),
          content: SingleChildScrollView(
            child: i == 0
                ? ListBody(
                    children: <Widget>[
                      TextFileLogin(
                        hintText: "new $node",
                        //errorText: validationService.phoneNumber.error,
                        cursorColor: Colors.grey,
                        borderSideColor: Colors.grey,
                        textStyleColor: Colors.grey,
                        textChange: (vals) {
                          //   validationService.changePhoneNumber(vals);
                        },
                        inputType: TextInputType.name,
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ],
                  )
                : ListBody(
                    children: <Widget>[
                      TextFileLogin(
                        hintText: "old $node",
                        //errorText: validationService.phoneNumber.error,
                        cursorColor: Colors.grey,
                        borderSideColor: Colors.grey,
                        textStyleColor: Colors.grey,
                        textChange: (vals) {
                          //   validationService.changePhoneNumber(vals);
                        },
                        inputType: TextInputType.name,
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFileLogin(
                        hintText: "new $node",
                        //errorText: validationService.phoneNumber.error,
                        cursorColor: Colors.grey,
                        borderSideColor: Colors.grey,
                        textStyleColor: Colors.grey,
                        textChange: (vals) {
                          //   validationService.changePhoneNumber(vals);
                        },
                        inputType: TextInputType.name,
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFileLogin(
                        hintText: "repeat new $node",
                        //errorText: validationService.phoneNumber.error,
                        cursorColor: Colors.grey,
                        borderSideColor: Colors.grey,
                        textStyleColor: Colors.grey,
                        textChange: (vals) {
                          //   validationService.changePhoneNumber(vals);
                        },
                        inputType: TextInputType.name,
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Edit'),
              onPressed: () {
                print("Send request");
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
