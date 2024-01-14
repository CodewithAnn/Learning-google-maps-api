import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';

class LatLongToAdd extends StatefulWidget {
  const LatLongToAdd({super.key});

  @override
  State<LatLongToAdd> createState() => _LatLongToAddState();
}

class _LatLongToAddState extends State<LatLongToAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Convert Lat/Long "),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: ElevatedButton(
            onPressed: () async {
              // For convert from  coordinate to Address(lat/long to Address)
              final _coordinate =
                  Coordinates(47.867519381885856, 12.107215213491571);
              var _address = await Geocoder.local
                  .findAddressesFromCoordinates(_coordinate);
              var first = _address.first;

              print("Address :" +
                  first.featureName.toString() +
                  "" +
                  first.addressLine.toString());

              // For Convert to coordinate from address(address to Lat/Long)
              // final query = "Hochschulstraße 1, 83024 Rosenheim, Germany";
              // var _coordinates =
              //     await Geocoder.local.findAddressesFromQuery(query);
              // var latLong = _coordinates.first;
            },
            child: Text("Convert")),
      )),
    );
  }
}
