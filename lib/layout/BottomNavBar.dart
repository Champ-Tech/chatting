import 'package:champteks/Home.dart';
import 'package:champteks/chat/Chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
      ],
      currentIndex: currentIndex,
      onTap: (index) {

        switch (index) {
          case 0:
            Get.to(() => Home());
            break;
          case 1:
            Get.to(() => Chat());
            break;
        }
        setState(() {
          currentIndex = index;
        });
      },
    );
  }
}
