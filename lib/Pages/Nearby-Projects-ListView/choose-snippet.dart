import 'package:companycam/Widgets/sizebox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChooseSnippet extends StatefulWidget {
  const ChooseSnippet({Key? key}) : super(key: key);

  @override
  _ChooseSnippetState createState() => _ChooseSnippetState();
}

class _ChooseSnippetState extends State<ChooseSnippet> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _searchText = TextEditingController();
  bool showXButton = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  const Text(
                    "Choose Snippet",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Expanded(child: Container()),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: OutlinedButton(onPressed: () {}, child: Text("Add")),
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
                          hintText: "Find a text snippet...",
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
                color: Colors.grey.shade300,
                height: 100,
                width: width,
                margin: EdgeInsets.all(12),
                child: Center(child: Text("No snippet found.")),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(width, 60),
            textStyle: TextStyle(fontSize: 14),
            primary: Colors.white,
            onPrimary: Colors.black),
        onPressed: () {},
        icon: const CircleAvatar(
          radius: 15,
          foregroundColor: Colors.black,
          backgroundColor: Colors.blue,
          child: Icon(
            Icons.add,
            color: Colors.black,
            size: 24,
          ),
        ),
        label: const Text(
          "Create New Snippet",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}
