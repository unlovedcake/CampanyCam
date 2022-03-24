import 'package:companycam/Pages/Nearby-Projects-ListView/choose-snippet.dart';
import 'package:companycam/Widgets/sizebox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class AddNotesDescription extends StatefulWidget {
  const AddNotesDescription({Key? key}) : super(key: key);

  @override
  _AddNotesDescriptionState createState() => _AddNotesDescriptionState();
}

class _AddNotesDescriptionState extends State<AddNotesDescription> {
  @override
  Widget build(BuildContext context) {
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
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: const Text(
                      "Notepad",
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
              Card(
                color: Colors.grey.shade300,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    maxLines: 14,
                    decoration:
                        InputDecoration.collapsed(hintText: "Tap her to add notes"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(370, 40),
                  textStyle: TextStyle(fontSize: 14),
                  primary: Color(0xff00ABC9),
                  onPrimary: Colors.white),
              onPressed: () {
                Get.to(ChooseSnippet());
              },
              child: const Text(
                "Snippets",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            addVerticalSpace(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Text(
                    "B",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Text(
                    "I",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.attach_file_rounded),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.format_list_bulleted_sharp),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.format_list_numbered_outlined),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
