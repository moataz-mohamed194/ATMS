import 'package:ATMS/get/IntroductionGet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class IntroScreen extends StatelessWidget {
//  final controller = ;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Get.put(Introduction()).timer(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset(
                    'images/logos/LOGO.png',
                  ),
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 6.336633663),
                ),
                SizedBox(
                  height: 66,
                ),
                Text(
                  "WELCOME\n in ATMS",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 13),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
