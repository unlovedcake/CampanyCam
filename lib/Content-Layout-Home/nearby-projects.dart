import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NearbyProjects extends StatefulWidget {
  const NearbyProjects({Key? key}) : super(key: key);

  @override
  _NearbyProjectsState createState() => _NearbyProjectsState();
}

class _NearbyProjectsState extends State<NearbyProjects> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: TextButton.icon(
        icon: const Text(
          "Nearby Projects",
          style:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        label: const Icon(
          Icons.arrow_right,
          color: Colors.black,
          size: 24,
        ),
        onPressed: () {},
      ),
    );
  }
}
