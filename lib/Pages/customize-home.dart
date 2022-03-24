import 'package:companycam/Widgets/sizebox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomizeHome extends StatefulWidget {
  const CustomizeHome({Key? key}) : super(key: key);

  @override
  _CustomizeHomeState createState() => _CustomizeHomeState();
}

class _CustomizeHomeState extends State<CustomizeHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 8, top: 40),
          alignment: Alignment.topLeft,
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
                    child: const Text(
                      "Customize Home",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              addVerticalSpace(40),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                height: 35,
                child: Text("Move home screen items to organize them below."),
              ),
              addVerticalSpace(20),
              OutlinedButton(
                onPressed: () {},
                child: Text(
                  "Reset Default Order",
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ),
              addVerticalSpace(10),
              Divider(
                thickness: .5,
                color: Colors.grey.shade300,
              ),
              addVerticalSpace(10),
              Container(
                margin: EdgeInsets.only(left: 8),
                alignment: Alignment.topLeft,
                child: Text("Active Items"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    minimumSize: const Size(370, 40),
                    textStyle: TextStyle(fontSize: 14),
                    primary: Colors.black,
                    backgroundColor: Colors.white38,
                  ),
                  icon: CircleAvatar(
                    radius: 16,
                    foregroundColor: Colors.black,
                    backgroundColor: Color(0xff00ABC9),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                  label: Row(
                    children: [
                      Column(
                        children: const [
                          Text(
                            "Company Feed",
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      const Icon(
                        Icons.menu,
                        color: Colors.black,
                        size: 24,
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
              addVerticalSpace(10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    minimumSize: const Size(370, 40),
                    textStyle: TextStyle(fontSize: 14),
                    primary: Colors.black,
                    backgroundColor: Colors.white38,
                  ),
                  icon: CircleAvatar(
                    radius: 16,
                    foregroundColor: Colors.black,
                    backgroundColor: Color(0xff00ABC9),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                  label: Row(
                    children: [
                      Column(
                        children: const [
                          Text(
                            "Starred People",
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      const Icon(
                        Icons.menu,
                        color: Colors.black,
                        size: 24,
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
              addVerticalSpace(10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    minimumSize: const Size(370, 40),
                    textStyle: TextStyle(fontSize: 14),
                    primary: Colors.black,
                    backgroundColor: Colors.white38,
                  ),
                  icon: CircleAvatar(
                    radius: 16,
                    foregroundColor: Colors.black,
                    backgroundColor: Color(0xff00ABC9),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                  label: Row(
                    children: [
                      Column(
                        children: const [
                          Text(
                            "My Feed",
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      const Icon(
                        Icons.menu,
                        color: Colors.black,
                        size: 24,
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
              addVerticalSpace(10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    minimumSize: const Size(370, 40),
                    textStyle: TextStyle(fontSize: 14),
                    primary: Colors.black,
                    backgroundColor: Colors.white38,
                  ),
                  icon: CircleAvatar(
                    radius: 16,
                    foregroundColor: Colors.black,
                    backgroundColor: Color(0xff00ABC9),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                  label: Row(
                    children: [
                      Column(
                        children: const [
                          Text(
                            "Starred Projects",
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      const Icon(
                        Icons.menu,
                        color: Colors.black,
                        size: 24,
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
              addVerticalSpace(10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    minimumSize: const Size(370, 40),
                    textStyle: TextStyle(fontSize: 14),
                    primary: Colors.black,
                    backgroundColor: Colors.white38,
                  ),
                  icon: CircleAvatar(
                    radius: 16,
                    foregroundColor: Colors.black,
                    backgroundColor: Color(0xff00ABC9),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                  label: Row(
                    children: [
                      Column(
                        children: const [
                          Text(
                            "Nearby Projects",
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      const Icon(
                        Icons.menu,
                        color: Colors.black,
                        size: 24,
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
