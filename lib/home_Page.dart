import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const CameraPosition _kcamraPosition = CameraPosition(
      target: LatLng(28.749709620347968, 77.11836119500983), zoom: 15.4416);
  final Completer<GoogleMapController> _controller = Completer();

  // create _marker an emptry list where we store our markers
  final List<Marker> _marker = [];

  // _list store intial and other markers objects
  final List<Marker> _list = [
    const Marker(
      markerId: MarkerId("1"),
      position: LatLng(28.749709620347968, 77.11836119500983),
      infoWindow: InfoWindow(title: "DTU Campus"),
    ),
    const Marker(
      markerId: MarkerId("2"),
      position: LatLng(28.744176178567297, 77.1179789742538),
      infoWindow: InfoWindow(title: "DTU Cafe"),
    ),
    const Marker(
      markerId: MarkerId("3"),
      position: LatLng(28.744176178567297, 77.1179789742538),
      infoWindow: InfoWindow(title: "TH Rosenheim"),
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Google Maps')]),
      ),
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _kcamraPosition,
          onMapCreated: (controller) {
            _controller.complete(controller);
          },
          markers: Set<Marker>.of(_marker),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          GoogleMapController controller = await _controller.future;
          controller.animateCamera(
            CameraUpdate.newCameraPosition(
             const CameraPosition(
                target: LatLng(47.86756256632046, 12.10717229814699),
                zoom: 14,
              ),
            ),
          );
          
        },
        child: Icon(Icons.location_on_outlined),
      ),
    );
  }
}
