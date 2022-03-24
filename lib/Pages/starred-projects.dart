import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StarredProjects extends StatefulWidget {
  const StarredProjects({Key? key}) : super(key: key);

  @override
  _StarredProjectsState createState() => _StarredProjectsState();
}

class _StarredProjectsState extends State<StarredProjects> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.grey[400],
          icon: const Icon(
            Icons.cancel,
            size: 40,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Starred Projects",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Card(
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
            );
          }),
    );
  }
}
