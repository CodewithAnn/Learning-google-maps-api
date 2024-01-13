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
      target: LatLng(28.749709620347968, 77.11836119500983), zoom: 14.4416);
  final Completer<GoogleMapController> _controller = Completer();
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
        ),
      ),
    );
  }
}
