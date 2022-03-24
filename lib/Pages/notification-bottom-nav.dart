import 'package:companycam/Widgets/bottom-navbar.dart';
import 'package:companycam/Widgets/sizebox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationBottomNav extends StatefulWidget {
  const NotificationBottomNav({Key? key}) : super(key: key);

  @override
  _NotificationBottomNavState createState() => _NotificationBottomNavState();
}

class _NotificationBottomNavState extends State<NotificationBottomNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(index: 3),
      body: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.only(left: 8, top: 40),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  color: Colors.grey[400],
                  icon: const Icon(
                    Icons.cancel,
                    size: 40,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  width: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Notifications",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.settings),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                  ),
                ),
              ],
            ),
            addVerticalSpace(20),
            Center(
              child: Container(
                child: Text("You're all caught up!"),
              ),
            )
          ],
        ),
      )),
    );
  }
}
