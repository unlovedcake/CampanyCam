import 'package:companycam/Content-Layout-Home/company-feed-content.dart';
import 'package:companycam/Content-Layout-Home/nearby-projects.dart';
import 'package:companycam/Content-Layout-Home/photos.dart';
import 'package:companycam/Content-Layout-Home/projects.dart';
import 'package:companycam/Pages/company-feed.dart';
import 'package:companycam/Pages/create-project.dart';
import 'package:companycam/Pages/customize-home.dart';
import 'package:companycam/Pages/nearby-projects-page.dart';
import 'package:companycam/Pages/scan-document.dart';
import 'package:companycam/Pages/searchbar.dart';
import 'package:companycam/Pages/starred-projects.dart';
import 'package:companycam/Pages/upload-photos.dart';
import 'package:companycam/Pages/Users-And-Groups/users-and-groups.dart';
import 'package:companycam/Pages/user-project-photos-reports.dart';
import 'package:companycam/Widgets/bottom-navbar.dart';
import 'package:companycam/Widgets/bottom-sheet.dart';
import 'package:companycam/Widgets/sizebox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "images/camera.png",
              fit: BoxFit.fill,
              height: 30,
              width: 30,
            ),
            Expanded(child: Container()),
            ActionChip(
                backgroundColor: Colors.cyan.shade50,
                label: Row(
                  children: const [
                    Icon(
                      Icons.assistant_direction_outlined,
                      color: Colors.black,
                    ),
                    Text("12 days left "),
                  ],
                ),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return BottomSheetHome.bottomSheet(context);
                      });
                }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                foregroundColor: Colors.black,
                backgroundColor: Colors.grey[300],
                child: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.grey.shade500,
                  ),
                  onPressed: () {
                    Get.to(const SearchBar());
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(index: 0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            addVerticalSpace(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.grey[300],
                      child: Column(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.add_location,
                              color: Colors.grey.shade500,
                            ),
                            onPressed: () {
                              Get.to(CreateProjects());
                            },
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text(
                        "Create Project",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.grey[300],
                      child: Column(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.people,
                              color: Colors.grey.shade500,
                            ),
                            onPressed: () {
                              Get.to(UsersAndGroups());
                            },
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text(
                        "Users & Group",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.grey[300],
                      child: Column(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.image,
                              color: Colors.grey.shade500,
                            ),
                            onPressed: () {
                              Get.to(UploadPhotos());
                            },
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text(
                        "Upload Photos",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.grey[300],
                      child: Column(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.scanner_outlined,
                              color: Colors.grey.shade500,
                            ),
                            onPressed: () {
                              Get.to(const ScanDocument());
                            },
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text(
                        "Scan Document",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            addVerticalSpace(20),
            Container(
              alignment: Alignment.topLeft,
              child: TextButton.icon(
                icon: const Text(
                  "Nearby Projects",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                ),
                label: const Icon(
                  Icons.arrow_right,
                  color: Colors.black,
                  size: 24,
                ),
                onPressed: () {
                  Get.to(const NearbyProjectsPage());
                },
              ),
            ),
            addVerticalSpace(20),
            NearbyProjects(),
            addVerticalSpace(8),
            addVerticalSpace(20),
            Container(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: CircleAvatar(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.grey[300],
                        child: const Text(
                          "CLU",
                          style: TextStyle(fontSize: 12),
                        )),
                  ),
                  TextButton.icon(
                    icon: const Text(
                      "Cake Love User",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    label: const Icon(
                      Icons.arrow_right,
                      color: Colors.black,
                      size: 24,
                    ),
                    onPressed: () {
                      Get.to(UserProjectsPhotosReports());
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    child: const Text(
                      "Photos",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Photos(),
                  Container(
                    margin: EdgeInsets.all(8),
                    child: const Text(
                      "Projects",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Projects(),
                ],
              ),
            ),
            addVerticalSpace(20),
            Container(
              margin: EdgeInsets.only(left: 8),
              alignment: Alignment.topLeft,
              child: TextButton.icon(
                icon: const Text(
                  "Company Feed",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                ),
                label: const Icon(
                  Icons.arrow_right,
                  color: Colors.black,
                  size: 24,
                ),
                onPressed: () {
                  Get.to(CompanyFeed());
                },
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 14),
              child: const Text(
                "Photos",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 8),
              alignment: Alignment.topLeft,
              child: CompanyFeedContent(),
            ),
            addVerticalSpace(20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: CircleAvatar(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.orange[300],
                    child: Icon(
                      Icons.star,
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton.icon(
                  icon: const Text(
                    "Starred People",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  label: const Icon(
                    Icons.arrow_right,
                    color: Colors.black,
                    size: 24,
                  ),
                  onPressed: () {
                    Get.to(UsersAndGroups());
                  },
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 8),
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 24,
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.grey[300],
                    child: Column(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.add,
                            color: Colors.grey.shade500,
                          ),
                          onPressed: () {
                            Get.to(UsersAndGroups());
                          },
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Text(
                      "Add More",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            addVerticalSpace(20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: CircleAvatar(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.orange[300],
                    child: Icon(
                      Icons.star,
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton.icon(
                  icon: const Text(
                    "Starred Projects",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  label: const Icon(
                    Icons.arrow_right,
                    color: Colors.black,
                    size: 24,
                  ),
                  onPressed: () {
                    Get.to(StarredProjects());
                  },
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 25, top: 12),
              child: Text(
                "When your star projects, they'll show up here for easy access ",
                style: TextStyle(color: Colors.grey[500]),
              ),
            ),
            addVerticalSpace(40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.grey[300],
                      child: Column(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.apps_rounded,
                              color: Colors.grey.shade500,
                            ),
                            onPressed: () {
                              Get.to(CustomizeHome());
                            },
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text(
                        "Customize Home",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.grey[300],
                      child: Column(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.message,
                              color: Colors.grey.shade500,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text(
                        "Chat with Support",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.grey[300],
                      child: Column(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.arrow_right_rounded,
                              color: Colors.grey.shade500,
                              size: 30,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text(
                        "Help Center",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            addVerticalSpace(20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(370, 90),
                    textStyle: TextStyle(fontSize: 14),
                    primary: Color(0xff00ABC9),
                    onPrimary: Colors.black),
                icon: CircleAvatar(
                  radius: 24,
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.blue[100]!,
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
                          "Love Customer App?",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          "Refer a friend and earn free stuff!",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
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
    );
  }
}
