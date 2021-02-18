import 'package:ATMS/get/DepartmentGet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:get/get.dart';
import 'Department_Screen.dart';
import '../general/Edit_Screen.dart';
import '../login/Login_Screen.dart';
import 'Requests_Screen.dart';
import '../general/Go_To_Scan_Screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  var _bottomNavIndex = 0;
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

  final controller = Get.put(DepartmentGet());

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
        actions: [
          _bottomNavIndex==2?IconButton(
            icon: const Icon(Icons.add_outlined),
            onPressed: () {
              print("add");
              controller.addDepartment(context);
            },
          ):Container(),
        ],
      ),
      body: NavigationScreen(
        data[_bottomNavIndex],
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        backgroundColor: Colors.blue,
        activeIndex: _bottomNavIndex,
        activeColor: Colors.black,
        inactiveColor: Colors.white,
        notchAndCornersAnimation: animation,
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
