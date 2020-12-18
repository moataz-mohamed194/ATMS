import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'EditGet.dart';

class ScanGet extends GetxController {
  GetStorage values = GetStorage();

  QRViewController controller;
  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      //setState(() {
      //qrText = scanData;
      //});
      if(scanData!=null){
        action();
      }
    });
  }
  final controller0 = Get.put(EditGet());
  var data;

  @override
  void onInit() {
    DateTime date = DateTime.now();
    String dateFormat = DateFormat('dd/MM/yyyy').format(date);

    data= FirebaseDatabase.instance.reference()
        .child('Here').child(dateFormat)
        .child("${controller0.iD.value}");

  }


  Future<void> action() async {
    String name="${values.read('userName')}";
    String iD="${values.read('ID')}";
    String department="${values.read('department')}";
    String img="${values.read('Img')}";
    DateTime date = DateTime.now();
    String dateFormat = DateFormat('dd/MM/yyyy').format(date);

    FirebaseDatabase.instance
        .reference()
        .child('Here').child(dateFormat)
        .child(iD)
        .set({
      'name': name,
      "Img":img,
      "department":department
    }).whenComplete(()  {
      // controller0.here.value='';
      // update();
      Get.back();

    });
  }

}
