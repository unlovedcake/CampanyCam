import 'package:companycam/Widgets/sizebox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> with TickerProviderStateMixin {
  final TextEditingController _searchText = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool showXButton = false;

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
          margin: const EdgeInsets.only(left: 10, top: 40),
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
                  SizedBox(
                    width: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Search",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  )
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
                          hintText: "Projects,users,groups or comments",
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
                            "All",
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
                            "People",
                            style: TextStyle(
                                color: _selectedIndex == 2 ? Colors.white : Colors.black),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Comments",
                            style: TextStyle(
                                color: _selectedIndex == 3 ? Colors.white : Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  body: TabBarView(
                    controller: _controller,
                    children: const [
                      Center(
                        child: Text("No search result found."),
                      ),
                      Center(child: Text("No search result found.")),
                      Center(child: Text("No search result found.")),
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
}
