import 'package:companycam/Pages/my-profile.dart';
import 'package:companycam/Widgets/bottom-navbar.dart';
import 'package:companycam/Widgets/sizebox.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:intl/intl.dart';

import 'edit-profile-info.dart';
import 'edit-projects.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> with TickerProviderStateMixin {
  DateTime _selectedDate = DateTime.now();

  final TextEditingController _searchText = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool showXButton = false;

  TabController? _controller;
  int _selectedIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 3, vsync: this);

    _controller!.addListener(() {
      setState(() {
        _selectedIndex = _controller!.index;
      });
      print("Selected Index: " + _controller!.index.toString());
    });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

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
                    child: TextButton.icon(
                      style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          onPrimary: Colors.black),
                      onPressed: () {
                        Get.to(MyProfile());
                      },
                      label: Icon(Icons.arrow_drop_down_outlined),
                      icon: Text(
                        "Cake Love User",
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
              Container(
                height: 768,
                // height: MediaQuery.of(context).size.width,
                child: Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.white,
                    elevation: 1,
                    bottom: TabBar(
                      controller: _controller,
                      labelPadding: EdgeInsets.all(2),
                      indicatorPadding: EdgeInsets.all(0),
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      // indicatorColor: Colors.blue,
                      // labelColor: Colors.blue,
                      unselectedLabelColor: Colors.grey,
                      unselectedLabelStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff00ABC9),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueAccent.withOpacity(0.5),
                            blurRadius: 15,
                            offset: Offset(0, 8), // changes position of shadow
                          ),
                        ],
                      ),
                      tabs: [
                        Tab(
                          iconMargin: EdgeInsets.only(bottom: 0),
                          child: Text(
                            "Photos",
                            style: TextStyle(
                                color: _selectedIndex == 0 ? Colors.white : Colors.black),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Projects",
                            style: TextStyle(
                                color: _selectedIndex == 1 ? Colors.white : Colors.black),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Reports",
                            style: TextStyle(
                                color: _selectedIndex == 2 ? Colors.white : Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  body: TabBarView(
                    controller: _controller,
                    children: [
                      tab1Content(),
                      tab2Content(),
                      tab3Content(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget tab1Content() {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 8, top: 12),
            child: Text(
              DateFormat.yMMMMd().format(_selectedDate),
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Card(
            elevation: 4,
            shadowColor: Colors.blueGrey,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey, width: 0.5),
                borderRadius: BorderRadius.circular(10)),
            child: Container(
              alignment: Alignment.topLeft,
              width: 200,
              height: 200,
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
        ],
      ),
      bottomNavigationBar: BottomNavBar(index: 4),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: FloatingActionButton(
              backgroundColor: Color(0xff00ABC9),
              foregroundColor: Colors.white,
              child: Icon(Icons.add_road),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget tab2Content() {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 4,
            shadowColor: Colors.blueGrey,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey, width: 0.5),
                borderRadius: BorderRadius.circular(10)),
            child: Container(
              alignment: Alignment.topLeft,
              width: MediaQuery.of(context).size.width,
              height: 300,
              margin: const EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Text(
                                "165 V.H Washington Street",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text("Talisay Central Visayas"),
                            ],
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.camera),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    Text(
                      "1 Photo * 0 Documents",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      height: 140,
                      width: 110,
                      child: Image(
                        image: NetworkImage(
                          'https://www.tutorialkart.com/img/hummingbird.png',
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        const Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.star,
                                color: Colors.grey.shade500,
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.send,
                                color: Colors.grey.shade500,
                              ),
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return bottomSheetShareOptions(context);
                                    });
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.more_horiz,
                                color: Colors.grey.shade500,
                              ),
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return bottomSheetProjectOptions(context);
                                    });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(index: 4),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: FloatingActionButton(
              backgroundColor: Color(0xff00ABC9),
              foregroundColor: Colors.white,
              child: Icon(Icons.add_road),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  static Widget bottomSheetProjectOptions(BuildContext context) {
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
                    Icon(Icons.add),
                    SizedBox(
                      width: 8,
                    ),
                    Text("Add Photos from Device"),
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
                  Get.to(EditProjects());

                  print("OKE");
                },
                child: Row(
                  children: [
                    Icon(Icons.edit),
                    SizedBox(
                      width: 8,
                    ),
                    Text("Edit Project"),
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

  Widget tab3Content() {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text("No search result found."),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(index: 4),
    );
  }

  static Widget bottomSheet(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        height: 200,
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
                      "User Options",
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
                    Icon(Icons.edit),
                    SizedBox(
                      width: 8,
                    ),
                    Text("Edit User"),
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
                    Text(
                      "Deactivate",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget bottomSheetShareOptions(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        height: 200,
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
                      "Share Options",
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
                  Get.to(EditProfileInfo());

                  print("OKE");
                },
                child: Row(
                  children: [
                    Icon(Icons.history),
                    SizedBox(
                      width: 8,
                    ),
                    Text("Share Project Timeline"),
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
                    Icon(Icons.image),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Share All Project Images",
                      style: TextStyle(),
                    ),
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
