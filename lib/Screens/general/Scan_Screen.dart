import 'package:ATMS/get/ScanGet.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:get/get.dart';

 class ScanScreen extends StatelessWidget{
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final qrText = "";
  final controllerGet = Get.put(ScanGet());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(child: Scaffold(body: Column(
      children: [
        Expanded(
          flex: 5,
          child: QRView(
            key: qrKey,
            onQRViewCreated: controllerGet.onQRViewCreated,
          ),
        ),
      ],
    ),));
  }
}