import 'package:companycam/Widgets/sizebox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'invite-users.dart';

class UsersAndGroups extends StatefulWidget {
  const UsersAndGroups({Key? key}) : super(key: key);

  @override
  _UsersAndGroupsState createState() => _UsersAndGroupsState();
}

class _UsersAndGroupsState extends State<UsersAndGroups> with TickerProviderStateMixin {
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
                    child: const Text(
                      "Users & Groups",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  IconButton(
                    padding: EdgeInsets.only(right: 8),
                    color: Colors.grey[400],
                    icon: const Icon(
                      Icons.add_circle_outline,
                      size: 40,
                      color: Color(0xff00ABC9),
                    ),
                    onPressed: () {
                      Get.to(InviteUsers());
                    },
                  ),
                ],
              ),
              addVerticalSpace(40),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                height: 45,
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                      controller: _searchText,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(26.0),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: showXButton
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      (context as Element)
                                          .markNeedsBuild(); // this line of code update the changes value
                                      _searchText.text = "";
                                      showXButton = false;
                                    },
                                    child: CircleAvatar(
                                        foregroundColor: Colors.black,
                                        backgroundColor: Colors.grey[300]!,
                                        radius: 10,
                                        child: const Icon(
                                          Icons.close,
                                          size: 12,
                                        )),
                                  ),
                                )
                              : const Padding(
                                  padding: EdgeInsets.all(8.0),
                                ),
                          filled: true,
                          focusColor: Colors.black,
                          hintStyle: const TextStyle(color: Colors.grey),
                          hintText: "Search for a users or groups",
                          fillColor: Colors.white70),
                      onChanged: (val) {
                        setState(() {});

                        if (val.isEmpty) {
                          showXButton = false;
                        } else {
                          showXButton = true;
                        }
                      }),
                ),
              ),
              Container(
                height: 680,
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
                            "Starred",
                            style: TextStyle(
                                color: _selectedIndex == 0 ? Colors.white : Colors.black),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Users",
                            style: TextStyle(
                                color: _selectedIndex == 1 ? Colors.white : Colors.black),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Groups",
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
                      Center(child: Text("No search result found.")),
                      tab2Content(),
                      Center(child: Text("No search result found.")),
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

  Widget tab2Content() {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: CircleAvatar(
                foregroundColor: Colors.black,
                backgroundColor: Colors.grey[300],
                child: const Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            ),
            TextButton.icon(
              icon: const Text(
                "Invite New Users",
                style: TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.w500, fontSize: 15),
              ),
              label: Text(""),
              onPressed: () {
                Get.to(InviteUsers());
              },
            ),
          ],
        ),
        addVerticalSpace(20),
        Row(
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
                    color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15),
              ),
              label: Text(""),
              onPressed: () {
                Get.to(InviteUsers());
              },
            ),
            Expanded(child: Container()),
            IconButton(
              icon: const Icon(
                Icons.star,
                color: Colors.blue,
                size: 24,
              ),
              onPressed: () {},
            ),
            SizedBox(
              width: 20,
            ),
            IconButton(
              padding: EdgeInsets.only(right: 8),
              icon: const Icon(
                Icons.more_horiz,
                color: Colors.black,
                size: 24,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
