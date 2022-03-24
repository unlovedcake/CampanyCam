import 'package:companycam/Content-Layout-Home/projects.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompanyFeedContent extends StatefulWidget {
  const CompanyFeedContent({Key? key}) : super(key: key);

  @override
  _CompanyFeedContentState createState() => _CompanyFeedContentState();
}

class _CompanyFeedContentState extends State<CompanyFeedContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Card(
            elevation: 4,
            shadowColor: Colors.blueGrey,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey, width: 0.5),
                borderRadius: BorderRadius.circular(10)),
            child: Container(
              width: 150,
              height: 150,
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
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.all(8),
          child: const Text(
            "Projects",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 320,
          child: ListView(
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
            children: const <Widget>[
              Projects(),
              Projects(),
            ],
          ),
        ),
      ],
    );
  }
}
