import 'package:companycam/Widgets/sizebox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.only(left: 4, top: 30),
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    "My Profile",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, top: 8),
                  child: OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        "Switch",
                        style: TextStyle(
                          color: Color(0xff00ABC9),
                        ),
                      )),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                  ),
                  child: Row(
                    children: [
                      FittedBox(
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.only(left: 14),
                            child: Column(
                              children: [
                                Text("CLU"),
                                Container(
                                  child: Icon(
                                    Icons.camera,
                                    size: 20,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cake Love User",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "First Boston Software Company",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
            Divider(
              thickness: .5,
              color: Colors.grey.shade300,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    "My Profile Info",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit,
                      color: Color(0xff00ABC9),
                    ),
                    label: Text(
                      "Edit",
                      style: TextStyle(
                        color: Color(0xff00ABC9),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              thickness: .5,
              color: Colors.grey.shade300,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Full Name",
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  addVerticalSpace(6),
                  Text(
                    "Cake Love User",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  addVerticalSpace(15),
                  Text(
                    "Work Email",
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  addVerticalSpace(6),
                  Text(
                    "sample@gmail.com",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  addVerticalSpace(15),
                  Text(
                    "Phone Number",
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  addVerticalSpace(6),
                  Text(
                    "09285763221",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  addVerticalSpace(15),
                  Text(
                    "Job Title",
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  addVerticalSpace(6),
                  Text(
                    "Software Developer",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  addVerticalSpace(15),
                  Text(
                    "T-shirt Size",
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  addVerticalSpace(6),
                  Text(
                    "XL",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: .5,
              color: Colors.grey.shade300,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    "Company Info",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit,
                      color: Color(0xff00ABC9),
                    ),
                    label: Text(
                      "Edit",
                      style: TextStyle(
                        color: Color(0xff00ABC9),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              thickness: .5,
              color: Colors.grey.shade300,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Company Name",
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  addVerticalSpace(6),
                  Text(
                    "First Boston Software Company",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  addVerticalSpace(10),
                  Text(
                    "Address",
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  addVerticalSpace(6),
                  Text(
                    "Washington Street",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  addVerticalSpace(10),
                  Text(
                    "Company Phone Number",
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  addVerticalSpace(6),
                  Text(
                    "0929847722",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  addVerticalSpace(10),
                  Text(
                    "Industry",
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  addVerticalSpace(6),
                  Text(
                    "Software Technoligy",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  addVerticalSpace(10),
                  Text(
                    "Company Size",
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  addVerticalSpace(6),
                  Text(
                    "Sample",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            addVerticalSpace(10),
          ],
        ),
      )),
    );
  }
}
