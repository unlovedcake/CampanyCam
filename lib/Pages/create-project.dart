import 'dart:typed_data';

import 'package:companycam/Widgets/sizebox.dart';
import 'package:companycam/Widgets/textformfied.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:geolocator/geolocator.dart';

class CreateProjects extends StatefulWidget {
  const CreateProjects({Key? key}) : super(key: key);

  @override
  _CreateProjectsState createState() => _CreateProjectsState();
}

class _CreateProjectsState extends State<CreateProjects> {
  final TextEditingController _searchText = TextEditingController();

  String googleApikey = "AIzaSyAaLbCngG0dtsSMIZb573UUa5urACAchjI";
  //String googleApikey = "AIzaSyDk09rnm5B0k3FuLsij7GCLUJAqF7oGVPc";
  GoogleMapController? mapController; //contrller for Google map
  CameraPosition? cameraPosition;
  LatLng startLocation = LatLng(10.2524, 123.8392);
  LatLng endLocation = LatLng(10.3157, 123.8854);

  String location = "Search Location";

  PolylinePoints polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> polylines = {}; //polylines to show direction
  bool isHide = false;

  double bottomPaddingOfMap = 0;

  currentLocation() async {
    try {
      GeoFirePoint? myLocation;
      Position? pos =
          await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      myLocation = GeoFirePoint(pos.latitude, pos.longitude);

      startLocation = LatLng(myLocation.latitude, myLocation.longitude);
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentLocation();
    addMarkers();
    getDirections();
    print(startLocation);
  }

  getDirections() async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApikey,
      PointLatLng(startLocation.latitude, startLocation.longitude),
      PointLatLng(endLocation.latitude, endLocation.longitude),
      //travelMode: TravelMode.bicycling,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    addPolyLine(polylineCoordinates);
  }

  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.deepPurpleAccent,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  Set<Marker> markers = Set(); //markers for google map
  addMarkers() async {
    BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "images/marker.png",
    );

    markers.add(Marker(
      //add start location marker
      markerId: MarkerId(startLocation.toString()),
      position: startLocation, //position of marker
      infoWindow: InfoWindow(
        //popup info
        title: 'Starting Point ',
        snippet: 'Start Marker',
      ),
      icon: markerbitmap, //Icon for Marker
    ));

    markers.add(Marker(
      //add start location marker
      markerId: MarkerId(startLocation.toString()),
      position: startLocation, //position of marker
      rotation: -45,
      infoWindow: InfoWindow(
        //popup info
        title: 'End Point ',
        snippet: 'End Marker',
      ),
      icon: markerbitmap, //Icon for Marker
    ));

    String imgurl = "https://www.fluttercampus.com/img/car.png";
    Uint8List bytes =
        (await NetworkAssetBundle(Uri.parse(imgurl)).load(imgurl)).buffer.asUint8List();

    markers.add(Marker(
      //add start location marker
      markerId: MarkerId(startLocation.toString()),
      position: startLocation, //position of marker
      infoWindow: InfoWindow(
        //popup info
        title: 'Car Point ',
        snippet: 'Car Marker',
      ),
      icon: BitmapDescriptor.fromBytes(bytes), //Icon for Marker
    ));

    setState(() {
      //refresh UI
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   iconTheme: IconThemeData(color: Colors.black),
        //   centerTitle: true,
        //   backgroundColor: Colors.white,
        //   elevation: 0,
        //   title: Container(
        //     height: 40,
        //     width: MediaQuery.of(context).size.width / 2,
        //     child: FittedBox(
        //       fit: BoxFit.scaleDown,
        //       child: Text(
        //         "Main Screen",
        //         style: TextStyle(color: Colors.red[200], fontSize: 18),
        //       ),
        //     ),
        //   ),
        // ),
        body: Stack(
          children: [
            GoogleMap(
              //Map widget from google_maps_flutter package
              padding: EdgeInsets.only(bottom: bottomPaddingOfMap),
              zoomGesturesEnabled: true, //enable Zoom in, out on map
              initialCameraPosition: CameraPosition(
                //innital position in map
                target: startLocation, //initial position
                zoom: 14.0, //initial zoom level
              ),
              markers: markers,
              polylines: Set<Polyline>.of(polylines.values), //polylines
              mapType: MapType.normal, //map type
              onMapCreated: (controller) {
                //method called when map is created
                setState(() {
                  mapController = controller;
                });
              },
              onCameraMove: (CameraPosition cameraPositiona) {
                cameraPosition = cameraPositiona;
              },
              onCameraIdle: () async {
                List<Placemark> placemarks = await placemarkFromCoordinates(
                    cameraPosition!.target.latitude, cameraPosition!.target.longitude);

                Placemark place = placemarks[0];

                setState(() {
                  bottomPaddingOfMap = 300.0;
                  location = "${place.locality}, ${place.postalCode}, ${place.country}";
                });
              },
            ),
            Positioned(
              top: 45.0,
              left: 22.0,
              child: GestureDetector(
                onTap: () {
                  //scaffoldKey.currentState!.openDrawer();
                },
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.cancel,
                          color: Colors.black,
                        ),
                        radius: 20.0,
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      margin: EdgeInsets.only(left: 10),
                      width: 320,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                          hintText: "Search...",
                          labelText: "Search",
                          border: OutlineInputBorder(
                              //borderRadius: BorderRadius.circular(10),
                              ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightBlue, width: 2.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 8.0,
              right: 8.0,
              bottom: 8.0,
              child: Container(
                height: (MediaQuery.of(context).size.height / 3),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 16.0,
                      spreadRadius: 0.5,
                      offset: Offset(0.7, 0.7),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 6.0,
                        ),

                        Text(
                          location,
                          style: TextStyle(fontSize: 20.0, fontFamily: "Brand-Bold"),
                        ),
                        addVerticalSpace(20),
                        Row(
                          children: [
                            Icon(
                              Icons.home,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 12.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Add Home"),
                                SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                  "Your living home address",
                                  style: TextStyle(color: Colors.black54, fontSize: 12.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // SizedBox(
                        //   height: 10.0,
                        // ),
                        // DividerWidget(),
                        SizedBox(
                          height: 16.0,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.work,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 12.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Add Work"),
                                SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                  "Your office address",
                                  style: TextStyle(color: Colors.black54, fontSize: 12.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                        addVerticalSpace(45),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(350, 40),
                              textStyle: TextStyle(fontSize: 14),
                              primary: Color(0xff00ABC9),
                              onPrimary: Colors.black),
                          onPressed: () {},
                          child: const Text(
                            "Confirm Project Location",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _fullNameText {}

Future<void> displayPrediction(
    Prediction? p, ScaffoldMessengerState messengerState) async {
  if (p == null) {
    return;
  }

  // get detail (lat/lng)
  final _places = GoogleMapsPlaces(
    apiKey: "AIzaSyDk09rnm5B0k3FuLsij7GCLUJAqF7oGVPc",
    apiHeaders: await const GoogleApiHeaders().getHeaders(),
  );

  final detail = await _places.getDetailsByPlaceId(p.placeId!);
  final geometry = detail.result.geometry!;
  final lat = geometry.location.lat;
  final lng = geometry.location.lng;

  messengerState.showSnackBar(
    SnackBar(
      content: Text('${p.description} - $lat/$lng'),
    ),
  );
}
