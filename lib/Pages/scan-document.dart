import 'package:companycam/Pages/create-project.dart';
import 'package:companycam/Widgets/sizebox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class ScanDocument extends StatefulWidget {
  const ScanDocument({Key? key}) : super(key: key);

  @override
  _ScanDocumentState createState() => _ScanDocumentState();
}

class _ScanDocumentState extends State<ScanDocument> with TickerProviderStateMixin {
  final TextEditingController _searchText = TextEditingController();

  bool showXButton = false;
  final _formKey = GlobalKey<FormState>();

  TabController? _controller;
  int _selectedIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 4, vsync: this);

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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
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
                      "Scan Document",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
              addVerticalSpace(40),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                height: 35,
                child: Text("Choose the project where you would like to scan documents."),
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
                            "Nearby",
                            style: TextStyle(
                                color: _selectedIndex == 0 ? Colors.white : Colors.black),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Recent",
                            style: TextStyle(
                                color: _selectedIndex == 1 ? Colors.white : Colors.black),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Map",
                            style: TextStyle(
                                color: _selectedIndex == 2 ? Colors.white : Colors.black),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Search",
                            style: TextStyle(
                                color: _selectedIndex == 3 ? Colors.white : Colors.black),
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
                      CreateProjects(),
                      tab4Content(),
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
    return Column(
      children: [
        addVerticalSpace(20),
        Card(
          elevation: 4,
          shadowColor: Colors.blueGrey,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey, width: 0.5),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Container(
                width: 100,
                child: Image.asset(
                  "images/camera.png",
                  fit: BoxFit.cover,
                  color: Colors.grey[300],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "165 V.H Washington Street",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("Cebu Central Visayas"),
                  ],
                ),
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Image.asset(
                  "images/camera.png",
                  fit: BoxFit.fill,
                  height: 20,
                  width: 20,
                ),
              ),
            ],
          ),
        ),
        Card(
          elevation: 4,
          shadowColor: Colors.blueGrey,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey, width: 0.5),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Container(
                width: 100,
                child: Image.asset(
                  "images/camera.png",
                  fit: BoxFit.cover,
                  color: Colors.grey[300],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "165 V.H Garces Street",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("Talisay Central Visayas"),
                  ],
                ),
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Image.asset(
                  "images/camera.png",
                  fit: BoxFit.fill,
                  height: 20,
                  width: 20,
                ),
              ),
            ],
          ),
        ),
        addVerticalSpace(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(182, 40),
                textStyle: TextStyle(fontSize: 14),
                primary: Colors.blue,
              ),
              onPressed: () {},
              child: const Text(
                "Refresh List",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(182, 40),
                  textStyle: TextStyle(fontSize: 14),
                  primary: Color(0xff00ABC9),
                  onPrimary: Colors.black),
              onPressed: () {
                Get.to(CreateProjects());
              },
              child: const Text(
                "New Project",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget tab2Content() {
    return Column(
      children: [
        addVerticalSpace(20),
        Card(
          elevation: 4,
          shadowColor: Colors.blueGrey,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey, width: 0.5),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Container(
                width: 100,
                child: Image.asset(
                  "images/camera.png",
                  fit: BoxFit.cover,
                  color: Colors.grey[300],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "165 V.H Washington Street",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("Cebu Central Visayas"),
                  ],
                ),
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Image.asset(
                  "images/camera.png",
                  fit: BoxFit.fill,
                  height: 20,
                  width: 20,
                ),
              ),
            ],
          ),
        ),
        Card(
          elevation: 4,
          shadowColor: Colors.blueGrey,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey, width: 0.5),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Container(
                width: 100,
                child: Image.asset(
                  "images/camera.png",
                  fit: BoxFit.cover,
                  color: Colors.grey[300],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "165 V.H Garces Street",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("Talisay Central Visayas"),
                  ],
                ),
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Image.asset(
                  "images/camera.png",
                  fit: BoxFit.fill,
                  height: 20,
                  width: 20,
                ),
              ),
            ],
          ),
        ),
        addVerticalSpace(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(182, 40),
                textStyle: TextStyle(fontSize: 14),
                primary: Colors.blue,
              ),
              onPressed: () {},
              child: const Text(
                "Refresh List",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(182, 40),
                  textStyle: TextStyle(fontSize: 14),
                  primary: Color(0xff00ABC9),
                  onPrimary: Colors.black),
              onPressed: () {},
              child: const Text(
                "New Project",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget tab4Content() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      height: 45,
      child: Form(
        key: _formKey,
        child: TextFormField(
            controller: _searchText,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(26.0),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
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
                hintText: "Search for project...",
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
    );
  }
}
