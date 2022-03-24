import 'package:companycam/Widgets/sizebox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetHome {
  static Widget bottomSheet(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        height: 550,
        color: const Color(0xff757575),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 82,
                  child: ActionChip(
                      backgroundColor: Color(0xff00ABC9),
                      label: Row(
                        children: const [
                          Icon(
                            Icons.assistant_direction_outlined,
                            color: Colors.white,
                          ),
                          Text(
                            " PRO",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {}),
                ),
                addVerticalSpace(20),
                const Text(
                  "You are currently \n in a free Pro trial!",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                addVerticalSpace(10),
                Text("Enjoy full access for feature like:"),
                addVerticalSpace(20),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      child: Column(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 18,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        "Video recording.",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
                addVerticalSpace(10),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      child: Column(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 18,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        "Gallery and timeline sharing",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
                addVerticalSpace(10),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      child: Column(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 18,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        "Before and after images",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
                addVerticalSpace(10),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      child: Column(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 18,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        "Professional photo reports",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
                addVerticalSpace(20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(width, 40),
                      textStyle: TextStyle(fontSize: 14),
                      primary: Color(0xff00ABC9),
                      onPrimary: Colors.black),
                  onPressed: () {},
                  child: const Text(
                    "Got It",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
