import 'package:ATMS/Widget/TextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:get/get.dart';
import 'Department_Screen.dart';
import 'Edit_Screen.dart';
import 'Login_Screen.dart';
import 'Requests_Screen.dart';
import 'Scan_Screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  var _bottomNavIndex = 0; //default index of first screen

  AnimationController _animationController;
  Animation<double> animation;
  CurvedAnimation curve;

  final iconList = <IconData>[
    Icons.home,
    Icons.menu,
    Icons.person,
    Icons.scanner,
  ];

  final data = [
    EditScreen(),
    RequestScreen(),
    DepartmentScreen(),
    ScanScreen()
  ];
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 1,
      end: 1,
    ).animate(curve);

    Future.delayed(
      Duration(seconds: 1),
      () => _animationController.forward(),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Data'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextFileLogin(
                  hintText: "Reason to leave",
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
              child: Text('send'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.blue),
        leading: Center(
          child: InkWell(
            child: Text(
              "Logout",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Get.off(LoginScreen());
            },
          ),
        ),
      ),
      body: NavigationScreen(
        data[_bottomNavIndex],
      ),
      floatingActionButton: ScaleTransition(
        scale: animation,
        child: FloatingActionButton(
          elevation: 8,
          backgroundColor: Colors.blue,
          child: Icon(
            Icons.arrow_forward,
            color: Color(0xff373A36),
          ),
          onPressed: () {
            print("hello");
            _showMyDialog();
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        backgroundColor: Colors.blue,
        activeIndex: _bottomNavIndex,
        activeColor: Colors.black,
        inactiveColor: Colors.white,
        notchAndCornersAnimation: animation,
        gapLocation: GapLocation.center,
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
    );
  }
}

class NavigationScreen extends StatefulWidget {
  final iconData;

  NavigationScreen(this.iconData) : super();

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.iconData;
  }
}
