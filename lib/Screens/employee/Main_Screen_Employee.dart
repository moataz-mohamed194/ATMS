import 'package:ATMS/get/MainGet.dart';
import 'package:ATMS/get/ValidationGet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:get/get.dart';
import '../general/Edit_Screen.dart';
import '../login/Login_Screen.dart';
import '../general/Go_To_Scan_Screen.dart';

class MainScreenEmployee extends StatefulWidget {
  @override
  _MyHomePageStateEmployee createState() => _MyHomePageStateEmployee();
}

class _MyHomePageStateEmployee extends State<MainScreenEmployee>
    with SingleTickerProviderStateMixin {
  var _bottomNavIndex = 0;
  AnimationController _animationController;
  Animation<double> animation;
  CurvedAnimation curve;

  final iconList = <IconData>[
    Icons.home,
    Icons.scanner,
  ];

  final data = [
    EditScreen(),
    GoToScanScreen()
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
  final controller = Get.put(ValidationGet());
  final controller1 = Get.put(MainGet());


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
            controller1.showMyDialog(context);
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
