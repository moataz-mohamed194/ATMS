import 'package:ATMS/Screens/general/Choose_Image_screen.dart';
import 'package:ATMS/Widget/TextField.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'ValidationGet.dart';
class EditGet extends GetxController {
  onChoseImage(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ChooseImage();
        });
  }


  var imageFile;
  final values = GetStorage();

  var name=''.obs;
  var iD=''.obs;
  var img=''.obs;
  var password=''.obs;
  var position=''.obs;
  var department=''.obs;
  var phoneNumber=''.obs;
  var pass=''.obs;
  var here=''.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    name="${values.read('userName')}".obs;
    iD="${values.read('ID')}".obs;
    img="${values.read('Img')}".obs;
    pass="${values.read('password')}".obs;
    int i=pass.value.length-2;
    password="${"*" * i}${pass.value.replaceRange(0, pass.value.length-2, "*")}".obs;
    position="${values.read('position')}".obs;
    department="${values.read('department')}".obs;
    phoneNumber="${values.read('PhoneNumber')}".obs;
  }
  Future<void> openCamera(BuildContext context) async {
    var picture = await ImagePicker().getImage(source: ImageSource.camera);
    imageFile = picture;
    print(imageFile);
    updateImage(picture);
    update();
  }

  Future<void> openGallery(BuildContext context) async {
    var picture = await ImagePicker().getImage(source: ImageSource.gallery);
    imageFile = picture;
    update();
    updateImage(picture);

  }
  final controller = Get.put(ValidationGet());

  Future<void> edit(BuildContext context, String node, int i) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Data'),
          content: SingleChildScrollView(
            child: i == 0
                ? ListBody(
                    children: <Widget>[
                      GetBuilder<ValidationGet>(
                          builder: (_) =>TextFileLogin(
                        hintText: "new $node",
                        errorText:
                        controller.phoneNumber.error,
                        cursorColor: Colors.grey,
                        borderSideColor: Colors.grey,
                        textStyleColor: Colors.grey,
                        textChange: (vals) {
                          controller.phoneNumberValidation(vals);
                        },
                        inputType: TextInputType.name,
                        hintStyle: TextStyle(color: Colors.grey),
                      )),
                    ],
                  )
                : ListBody(
                    children: <Widget>[

                      GetBuilder<ValidationGet>(
                          builder: (_) =>TextFileLogin(
                        hintText: "old $node",
                        errorText:controller.oldPassword.error,
                        cursorColor: Colors.grey,
                        borderSideColor: Colors.grey,
                        textStyleColor: Colors.grey,
                        textChange: (vals) {
                          controller.validationOldPassword(vals,pass.value);

                        },
                        inputType: TextInputType.name,
                        hintStyle: TextStyle(color: Colors.grey),
                      )),
                      SizedBox(
                        height: 10,
                      ),

                      GetBuilder<ValidationGet>(
                          builder: (_) =>TextFileLogin(
                        hintText: "new $node",
                        errorText: controller.passwordEmployee.error,
                        cursorColor: Colors.grey,
                        borderSideColor: Colors.grey,
                        textStyleColor: Colors.grey,
                        textChange: (vals) {
                          controller.passwordEmployeeValidation(vals);
                        },
                        inputType: TextInputType.name,
                        hintStyle: TextStyle(color: Colors.grey),
                      )),
                      SizedBox(
                        height: 10,
                      ),

                      GetBuilder<ValidationGet>(
                          builder: (_) =>TextFileLogin(
                        hintText: "repeat new $node",
                        errorText:controller.repeatPassword.error,
                        cursorColor: Colors.grey,
                        borderSideColor: Colors.grey,
                        textStyleColor: Colors.grey,
                        textChange: (vals) {
                          controller.validationRepeatPassword(vals);
                          },
                        inputType: TextInputType.name,
                        hintStyle: TextStyle(color: Colors.grey),
                      )),
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
                  if(node=="PhoneNumber"&&controller.phoneNumber.value!=null) {
                  updateData(controller.phoneNumber.value,"PhoneNumber",iD.value,department.value).whenComplete(() {
                    values.write('PhoneNumber', controller.phoneNumber.value);
                    phoneNumber="${values.read('PhoneNumber')}".obs;
                    Navigator.of(context).pop();
                  });
                }else if(node=="Password"&&controller.oldPassword.value!=null&&controller.passwordEmployee.value!=null&&controller.repeatPassword.value!=null){
                  updateData(controller.passwordEmployee.value,"password",iD.value,department.value).whenComplete(() {
                    values.write('password', controller.passwordEmployee.value);
                    phoneNumber="${values.read('password')}".obs;
                    Navigator.of(context).pop();

                  });
                }
                  update();
              },
            ),
          ],
        );
      },
    );
  }
  Future<void> updateData(String data,String node,String id,String department) async {
    FirebaseDatabase.instance
        .reference()
        .child('Employee').child(id).child(department).update(
        {"$node": data}).whenComplete(() {

    });

  }

  Future<void> updateImage(var imageFile0) async{
   firebase_storage.UploadTask uploadTask;
   firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
       .ref()
       .child('${name.value}.jpg');
   final metadata = firebase_storage.SettableMetadata(
       contentType: 'image/jpeg',
       customMetadata: {'picked-file-path': imageFile0.path});
   uploadTask = ref.putData(await imageFile0.readAsBytes(), metadata);
   final link = await ref.getDownloadURL();
   uploadTask.whenComplete(() {
     FirebaseDatabase.instance
           .reference()
           .child('Employee').child(iD.value).child(department.value).update(
           {"img": link}).whenComplete(() {
       values.write('Img', link);

       });
   });
    }
}
