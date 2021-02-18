import 'package:ATMS/get/EditGet.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'Scan_Screen.dart';

class GoToScanScreen extends StatelessWidget {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final controller = Get.put(EditGet());
  final String dateFormat = DateFormat('dd/MM/yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body:
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              StreamBuilder(
        stream: FirebaseDatabase.instance.reference()
            .child('Here').child(dateFormat)
            .child("${controller.iD.value}").onValue,
        builder: (context, snap) {
          if(snap.hasData) {
            return Text(snap.data.snapshot.value.toString() != "null" ?
            "Did you scan ? yes" : "Did you scan ? no"
              , style: TextStyle(fontSize: MediaQuery
                  .of(context)
                  .size
                  .width / 20),);
          }else if (snap.hasError){
            return Text("Loading");
          }else{
            return Container();
          }
    }),
      Container(
                  width: MediaQuery.of(context).size.width/3,
                  child: FlatButton(child: Text("Scan"),onPressed: (){
                    Get.to(ScanScreen());
                  },
                  color: Colors.blue,),
                ),
              ],
            ),
          ),),
    );
  }
}
