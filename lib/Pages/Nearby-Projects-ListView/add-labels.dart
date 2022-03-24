import 'package:companycam/Widgets/sizebox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddLabels extends StatefulWidget {
  const AddLabels({Key? key}) : super(key: key);

  @override
  _AddLabelsState createState() => _AddLabelsState();
}

class _AddLabelsState extends State<AddLabels> {
  var _result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 40),
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
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: const Text(
                      "Labels",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: OutlinedButton(onPressed: () {}, child: Text("Save")),
                  )
                ],
              ),
              addVerticalSpace(20),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(370, 40),
                    textStyle: TextStyle(fontSize: 14),
                    primary: Color(0xff00ABC9),
                    onPrimary: Colors.white),
                onPressed: () {},
                icon: const CircleAvatar(
                  radius: 15,
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.add,
                    color: Color(0xff00ABC9),
                    size: 24,
                  ),
                ),
                label: const Text(
                  "Create New Label",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              addVerticalSpace(50),
              RadioListTile(
                  title: Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(fontSize: 14),
                            primary: Colors.green,
                            onPrimary: Colors.black),
                        onPressed: () {},
                        child: const Text(
                          "Active",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (context) {
                                return bottomSheet(context);
                              });
                        },
                        icon: Icon(Icons.edit),
                      ),
                    ],
                  ),
                  value: "Active",
                  groupValue: _result,
                  onChanged: (value) {
                    setState(() {
                      _result = value;
                    });
                  }),
              RadioListTile(
                  title: Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(fontSize: 14),
                            primary: Colors.blue,
                            onPrimary: Colors.black),
                        onPressed: () {},
                        child: const Text(
                          "Bid",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.edit),
                      ),
                    ],
                  ),
                  value: "Bid",
                  groupValue: _result,
                  onChanged: (value) {
                    setState(() {
                      _result = value;
                    });
                  }),
              RadioListTile(
                  title: Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(fontSize: 14),
                            primary: Colors.blueGrey,
                            onPrimary: Colors.black),
                        onPressed: () {},
                        child: const Text(
                          "Complete",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.edit),
                      ),
                    ],
                  ),
                  value: "Complete",
                  groupValue: _result,
                  onChanged: (value) {
                    setState(() {
                      _result = value;
                    });
                  }),
              RadioListTile(
                  title: Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(fontSize: 14),
                            primary: Colors.orange,
                            onPrimary: Colors.black),
                        onPressed: () {},
                        child: const Text(
                          "Important",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.edit),
                      ),
                    ],
                  ),
                  value: "Important",
                  groupValue: _result,
                  onChanged: (value) {
                    setState(() {
                      _result = value;
                    });
                  }),
              RadioListTile(
                  title: Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(fontSize: 14),
                            primary: Colors.yellow,
                            onPrimary: Colors.black),
                        onPressed: () {},
                        child: const Text(
                          "In-Progress",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.edit),
                      ),
                    ],
                  ),
                  value: "In-Progress",
                  groupValue: _result,
                  onChanged: (value) {
                    setState(() {
                      _result = value;
                    });
                  }),
              RadioListTile(
                  title: Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(fontSize: 14),
                            primary: Colors.cyanAccent,
                            onPrimary: Colors.black),
                        onPressed: () {},
                        child: const Text(
                          "Paid",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.edit),
                      ),
                    ],
                  ),
                  value: "Paid",
                  groupValue: _result,
                  onChanged: (value) {
                    setState(() {
                      _result = value;
                    });
                  }),
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
            children: <Widget>[
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancel")),
                  Spacer(),
                  Container(
                    child: Text(
                      "Edit Label",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                      onTap: () {},
                      child: Text(
                        "Save",
                        style: TextStyle(color: Colors.blue),
                      )),
                ],
              ),
              Container(
                width: width,
                child: Divider(
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),
              ),
              Spacer(),
              Wrap(
                // direction: Axis.vertical,
                // alignment: WrapAlignment.center,
                spacing: 6.0,
                // runAlignment:WrapAlignment.center,
                runSpacing: 6.0,
                // crossAxisAlignment: WrapCrossAlignment.center,
                // textDirection: TextDirection.rtl,
                // verticalDirection: VerticalDirection.up,
                children: <Widget>[
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(4),
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        radius: 12,
                        child: Icon(
                          Icons.check,
                          size: 12,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      border: Border.all(
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      border: Border.all(
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      border: Border.all(
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      border: Border.all(
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      border: Border.all(
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      border: Border.all(
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      border: Border.all(
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
              addVerticalSpace(40),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(370, 40),
                    textStyle: TextStyle(fontSize: 14),
                    primary: Color(0xff00ABC9),
                    onPrimary: Colors.white),
                onPressed: () {},
                label: const Text(
                  "Delete Label",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
                icon: Icon(
                  Icons.delete,
                  color: Colors.red[300],
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
