import 'package:companycam/Widgets/sizebox.dart';
import 'package:companycam/Widgets/textformfied.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InviteUsers extends StatefulWidget {
  const InviteUsers({Key? key}) : super(key: key);

  @override
  _InviteUsersState createState() => _InviteUsersState();
}

class _InviteUsersState extends State<InviteUsers> with TickerProviderStateMixin {
  final TextEditingController _searchText = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();

  bool showXButton = false;

  TabController? _controller;
  int _selectedIndex = 0;

  final TextEditingController _emailText = TextEditingController();
  final TextEditingController _fullNameText = TextEditingController();
  final TextEditingController _phoneNumberText = TextEditingController();

  bool _isHidden = true;

  bool valuefirst = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 2, vsync: this);

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
                      "Invite Users",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
              Container(
                height: 770,
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
                            "Contacts",
                            style: TextStyle(
                                color: _selectedIndex == 0 ? Colors.white : Colors.black),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Manual add",
                            style: TextStyle(
                                color: _selectedIndex == 1 ? Colors.white : Colors.black),
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
    return Column(children: [
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
                  hintText: "Search for a person",
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
      addVerticalSpace(40),
      Center(child: Text("No Contacts Found"))
    ]);
  }

  Widget tab2Content() {
    return SingleChildScrollView(
      child: Container(
        height: 450,
        child: Form(
          key: _formKey1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              addVerticalSpace(50),
              TextFormFields.textFormFields("Full Name", _fullNameText,
                  widget: null,
                  sufixIcon: null,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next, validator: (value) {
                if (value!.isEmpty) {
                  return ("Full name is required");
                }
              }, onChanged: (val) {}),
              addVerticalSpace(20),
              TextFormFields.textFormFields("Work Email", _emailText,
                  widget: null,
                  sufixIcon: showXButton
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              (context as Element)
                                  .markNeedsBuild(); // this line of code update the changes value
                              _emailText.text = "";
                              showXButton = false;
                            },
                            child: CircleAvatar(
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.grey[300]!,
                                radius: 10,
                                child: const Icon(
                                  Icons.close,
                                  size: 14,
                                )),
                          ),
                        )
                      : const Padding(
                          padding: EdgeInsets.all(8.0),
                        ),
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next, validator: (value) {
                if (value!.isEmpty) {
                  return ("Email is required");
                } else if (!value!.contains("@")) {
                  return ("Invalid Email Format");
                }
              }, onChanged: (val) {
                setState(() {});

                if (val.isEmpty) {
                  showXButton = false;
                } else {
                  showXButton = true;
                }
              }),
              addVerticalSpace(20),
              TextFormFields.textFormFields("Phone Number", _phoneNumberText,
                  widget: null,
                  sufixIcon: null,
                  obscureText: false,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.done, validator: (value) {
                if (value!.isEmpty) {
                  return ("Phone number is required ");
                }
              }, onChanged: (val) {}),
              addVerticalSpace(20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(370, 40),
                    textStyle: TextStyle(fontSize: 14),
                    primary: Color(0xff00ABC9),
                    onPrimary: Colors.white),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
                child: const Text(
                  "Invite New User",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
