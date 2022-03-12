import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Photos extends StatefulWidget {
  const Photos({Key? key}) : super(key: key);

  @override
  _PhotosState createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Card(
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
    );
  }
}
