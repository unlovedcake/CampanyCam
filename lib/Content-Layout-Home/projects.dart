import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.blueGrey,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(10)),
      child: Container(
        alignment: Alignment.topLeft,
        width: 200,
        height: 300,
        margin: const EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: NetworkImage(
                  'https://www.tutorialkart.com/img/hummingbird.png',
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          child: Column(
                            children: const [
                              Text(
                                "165 V.H Garces",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Cebu Central Visayas",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(child: Container()),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
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
                  const Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.star,
                          color: Colors.grey.shade500,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.send,
                          color: Colors.grey.shade500,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.menu,
                          color: Colors.grey.shade500,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
