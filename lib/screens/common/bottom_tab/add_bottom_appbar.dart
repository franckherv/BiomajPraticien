// ignore_for_file: must_be_immutable

import 'package:biomaj/constants/app_images.dart';
import 'package:biomaj/screens/examens/examen_screen.dart';
import 'package:biomaj/screens/homeScreen/home_screen.dart';
import 'package:biomaj/screens/notification/notification.dart';
import 'package:flutter/material.dart';

class SharedBottomAppBar extends StatefulWidget {
  int? defauldIndex;

  SharedBottomAppBar({this.defauldIndex});
  @override
  _SharedBottomAppBarState createState() => _SharedBottomAppBarState();
}

class _SharedBottomAppBarState extends State<SharedBottomAppBar> {
  // Widget _lastSelected = HomeOuvrierScreen();

  int _currentIndex = 2;

  final _children = [HomeScreen(), ExamenScreen(), Notifications()];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  // int selectedIndex = 0;

  @override
  void initState() {
    if (widget.defauldIndex != null) {
      setState(() {
        _currentIndex = widget.defauldIndex!;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (dynamic index) {
            setState(() {
              _currentIndex = index;
              // if (index != 0 && CommonVariable.userTken == null) {
              //   index = _children[_currentIndex = 0];
              //   openAlertBox();
              // }
            });
          },
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(AppImages.home),
                ),
                label: ''),
            BottomNavigationBarItem(
               icon: ImageIcon(
                  AssetImage(AppImages.analyseIcon),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications,
                ),
                label: '')
          ],
        ),
      ),
    );
  }
}
