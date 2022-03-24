import 'package:companycam/Pages/Nearby-Projects-ListView/add-labels.dart';
import 'package:companycam/Pages/Nearby-Projects-ListView/add-notes-description.dart';
import 'package:companycam/Widgets/sizebox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class NearbyProjectsListView extends StatefulWidget {
  const NearbyProjectsListView({Key? key}) : super(key: key);

  @override
  _NearbyProjectsListViewState createState() => _NearbyProjectsListViewState();
}

class _NearbyProjectsListViewState extends State<NearbyProjectsListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Container(
          margin: const EdgeInsets.only(left: 10, top: 40),
          alignment: Alignment.topLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                  Expanded(child: Container()),
                  IconButton(
                    icon: const Icon(
                      Icons.star,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.more_horiz,
                      size: 30,
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return bottomSheet(context);
                          });
                    },
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                alignment: Alignment.topLeft,
                child: const Text(
                  "165 V.H washington Street",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(AddNotesDescription());
                },
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.add_moderator_outlined,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text("Add Notes/Description"),
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.add_location_alt_outlined,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Flexible(
                    child: Container(
                      child: const Text(
                        "165 V.H Washington Street . Talisay Central Visayasadsadsadasdas",
                        style: TextStyle(
                            color: Colors.blue, overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      minimumSize: Size(100, 40),
                      textStyle: TextStyle(fontSize: 14),
                      primary: Colors.white,
                    ),
                    onPressed: () {
                      Get.to(AddLabels());
                    },
                    icon: CircleAvatar(
                      radius: 15,
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                    label: const Text(
                      "Add Labels",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      minimumSize: Size(100, 40),
                      textStyle: TextStyle(fontSize: 14),
                      primary: Colors.white,
                    ),
                    onPressed: () {},
                    icon: CircleAvatar(
                      radius: 15,
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.grey[400],
                      child: Icon(
                        Icons.person,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                    label: const Text(
                      "Add Collaborators",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text("Photos (0)",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )),
                        Expanded(child: Container()),
                        TextButton.icon(
                          icon: const Text(
                            "View All",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          label: const Icon(
                            Icons.arrow_right,
                            color: Colors.black,
                            size: 24,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Card(
                  elevation: 4,
                  shadowColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey, width: 0.5),
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    alignment: Alignment.topLeft,
                    width: 150,
                    height: 150,
                    margin: const EdgeInsets.all(8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Image(
                            image: NetworkImage(
                                'https://www.tutorialkart.com/img/hummingbird.png'),
                          ),
                          Text(
                            "165 V.H Garces",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 6, right: 14, top: 14),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 60),
                      textStyle: TextStyle(fontSize: 14),
                      primary: Colors.white,
                      onPrimary: Colors.black),
                  icon: const CircleAvatar(
                    radius: 15,
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.threesixty_rounded,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                  label: Row(
                    children: [
                      Column(
                        children: const [
                          Text(
                            "Make To-Do List",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 6, right: 14, top: 14),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 60),
                      textStyle: TextStyle(fontSize: 14),
                      primary: Colors.white,
                      onPrimary: Colors.black),
                  icon: const CircleAvatar(
                    radius: 15,
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.threesixty_rounded,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                  label: Row(
                    children: [
                      Column(
                        children: const [
                          Text(
                            "Create A Report",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 6, right: 14, top: 14),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 60),
                      textStyle: TextStyle(fontSize: 14),
                      primary: Colors.white,
                      onPrimary: Colors.black),
                  icon: const CircleAvatar(
                    radius: 15,
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.threesixty_rounded,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                  label: Row(
                    children: [
                      Column(
                        children: const [
                          Text(
                            "Scan A Document",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
              addVerticalSpace(16),
              Container(
                height: 50,
                width: 150,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xff00ABC9),
                  border: Border.all(
                    color: Color(0xff00ABC9),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 12, right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 24,
                      ),
                      Icon(
                        Icons.camera,
                        color: Colors.black,
                        size: 24,
                      ),
                    ],
                  ),
                ),
              ),
              addVerticalSpace(20),
              Container(
                alignment: Alignment.bottomLeft,
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    CircleAvatar(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.grey[300],
                      child: const Text(
                        "CLU",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Tap to start conversation",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text("Use @ to mention team members"),
                        ],
                      ),
                    ),
                    Spacer(),
                    Image.asset(
                      "images/image1.png",
                      fit: BoxFit.fill,
                      height: 60,
                      width: 60,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  static Widget bottomSheet(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        height: 350,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.close)),
                  Spacer(),
                  Container(
                    child: Text(
                      "Project Options",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Spacer(),
                ],
              ),
              Container(
                width: width,
                child: Divider(
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),
              ),
              InkWell(
                onTap: () {
                  print("OKE");
                },
                child: Row(
                  children: [
                    Icon(Icons.three_p),
                    SizedBox(
                      width: 8,
                    ),
                    Text("Get Direction"),
                  ],
                ),
              ),
              Container(
                width: width,
                child: Divider(
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),
              ),
              InkWell(
                onTap: () {
                  print("OKE");
                },
                child: Row(
                  children: [
                    Icon(Icons.access_alarms_rounded),
                    SizedBox(
                      width: 8,
                    ),
                    Text("Shared Project Timeline"),
                  ],
                ),
              ),
              Container(
                width: width,
                child: Divider(
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),
              ),
              InkWell(
                onTap: () {
                  print("OKE");
                },
                child: Row(
                  children: [
                    Icon(Icons.eleven_mp),
                    SizedBox(
                      width: 8,
                    ),
                    Text("Share All Project Images"),
                  ],
                ),
              ),
              Container(
                width: width,
                child: Divider(
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),
              ),
              InkWell(
                onTap: () {
                  print("OKE");
                },
                child: Row(
                  children: [
                    Icon(Icons.edit),
                    SizedBox(
                      width: 8,
                    ),
                    Text("Edit Project Details"),
                  ],
                ),
              ),
              Container(
                width: width,
                child: Divider(
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),
              ),
              InkWell(
                onTap: () {
                  print("OKE");
                },
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(
                      width: 8,
                    ),
                    Text("Delete Project"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
