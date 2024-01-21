import 'dart:async';

import 'dart:typed_data';
import 'dart:ui' as Ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMarker extends StatefulWidget {
  const CustomMarker({super.key});

  @override
  State<CustomMarker> createState() => _CustomMarkerState();
}

class _CustomMarkerState extends State<CustomMarker> {
  CameraPosition _initialCameraPosition = CameraPosition(
      target: LatLng(28.749800090704703, 77.1182977503651), zoom: 14);

  Completer<GoogleMapController> _controller = Completer();

  // list of images which is allot by its index
  List<String> images = [
    "assets/images/train.png",
    "assets/images/cafe.png",
    "assets/images/hotel.png",
    "assets/images/sports-car.png",
    "assets/images/ride-a-bike.png",
    "assets/images/home.png",
    "assets/images/delivery-bike.png",
  ];

  // list of all lat/long according images list index
  final List<LatLng> _latLongForImage = <LatLng>[
    const LatLng(28.744626382203762, 77.13807643759264),
    const LatLng(28.74135278488514, 77.11533130500129),
    const LatLng(28.744298180582014, 77.11696742105342),
    const LatLng(28.74351849160061, 77.12382770534896),
    const LatLng(28.732199019996667, 77.1183547355991),
    const LatLng(28.68835379477672, 77.1372289273736),
    const LatLng(28.70002511905907, 77.11824320645648),
  ];

  // Markers
  final List<Marker> _marker = <Marker>[
    // default marker
    const Marker(
        markerId: MarkerId("1"),
        position: LatLng(28.749800090704703, 77.1182977503651),
        infoWindow: InfoWindow(title: "DTU")),
  ];

  Future<Uint8List> getImagesFromMarkes(String path, int width) async {
    ByteData _data = await rootBundle.load(path);
    Ui.Codec _codec = await Ui.instantiateImageCodec(_data.buffer.asUint8List(),
        targetHeight: width);
    Ui.FrameInfo _frameInfo =
        await _codec.getNextFrame(); //await for image to load completely
    return (await _frameInfo.image.toByteData(format: Ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  packData() async {
    for (int index = 0; index < images.length; index++) {
      final Uint8List iconMarker =
          await getImagesFromMarkes(images[index], 100);

      _marker.add(
        Marker(
          markerId: MarkerId(index.toString()),
          position: _latLongForImage[index],
          icon: BitmapDescriptor.fromBytes(iconMarker),
          infoWindow: InfoWindow(title: "Title marker : ${index}"),
        ),
      );
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    packData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Marker"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _initialCameraPosition,
          onMapCreated: (controller) {
            _controller.complete(controller);
          },
          markers: Set<Marker>.of(_marker),
        ),
      ),
    );
  }
}
