import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

Set<Marker> markers = {};

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Google Maps here..."),
              SizedBox(
                height: 400,
                width: MediaQuery.of(context).size.width,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(37.42796133580664, -122.085749655962),
                    zoom: 15,
                    bearing: 15,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await launchUrlString(
              "https://www.google.com/maps/search/?api=1&query=37.42796133580664,-122.085749655962");
        },
      ),
    );
  }
}
