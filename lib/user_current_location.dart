import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserCurrentLocation extends StatefulWidget {
  const UserCurrentLocation({super.key});

  @override
  State<UserCurrentLocation> createState() => _UserCurrentLocationState();
}

class _UserCurrentLocationState extends State<UserCurrentLocation> {
  // controller
  final Completer<GoogleMapController> _controller = Completer();
  // initial view
  static const CameraPosition _initialCamraPosition = CameraPosition(
      target: LatLng(28.690762660342674, 77.13567393748464), zoom: 14.4);

  // Markers
  final List<Marker> _marker = <Marker>[
    const Marker(
      markerId: MarkerId("1"),
      infoWindow: InfoWindow(title: "Xero Degrees Cafe"),
      position: LatLng(28.690762660342674, 77.13567393748464),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Users Location"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _initialCamraPosition,
          onMapCreated: (controller) {
            _controller.complete(controller);
          },
          markers: Set<Marker>.of(_marker),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.location_on),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
    );
  }
}
