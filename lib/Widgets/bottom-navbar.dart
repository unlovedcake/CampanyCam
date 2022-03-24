import 'package:companycam/Pages/company-feed.dart';
import 'package:companycam/Pages/gallery-bottom-nav.dart';
import 'package:companycam/Pages/home.dart';
import 'package:companycam/Pages/notification-bottom-nav.dart';
import 'package:companycam/Pages/user-profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class BottomNavBar extends StatefulWidget {
  final int index;

  const BottomNavBar({required this.index});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.grey[100],
      selectedIconTheme: IconThemeData(
        color: Color(0xff00ABC9),
      ),
      selectedItemColor: Color(0xff00ABC9),
      type: BottomNavigationBarType.fixed,
      currentIndex: widget.index,
      onTap: (value) async {
        setState(() {});
      },
      items: [
        BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Get.to(Home());
              },
            ),
            label: "Home"),

        BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.image),
              onPressed: () {
                Get.to(const GalleryBottomNav());
              },
            ),
            label: "Gallery"),

        BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.camera),
              onPressed: () {},
            ),
            label: "Camera"),

        BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.message),
              onPressed: () {
                Get.to(NotificationBottomNav());
              },
            ),
            label: "Notification"),

        BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Get.to(UserProfile());
              },
            ),
            label: "Profile"),

        // BottomNavigationBarItem(
        //   icon: CircleAvatar(
        //     radius: 14,
        //     backgroundImage: AssetImage("assets/images/user_2.png"),
        //   ),
        //   label: "Profile",
        // ),
      ],
    );
  }
}
