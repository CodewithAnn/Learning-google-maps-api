import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';

class LatLongToAdd extends StatefulWidget {
  const LatLongToAdd({super.key});

  @override
  State<LatLongToAdd> createState() => _LatLongToAddState();
}

class _LatLongToAddState extends State<LatLongToAdd> {
  String showAddress = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Convert Lat/Long "),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(showAddress),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.089,
            ),
            ElevatedButton(
                onPressed: () async {
                  // For convert from  coordinate to Address(lat/long to Address)
                  final _coordinate =
                      Coordinates(47.867519381885856, 12.107215213491571);
                  var _address = await Geocoder.local
                      .findAddressesFromCoordinates(_coordinate);
                  var first = _address.first;

                  print("Address : " +
                      // first.featureName.toString() +
                      "" +
                      first.addressLine.toString());

                  // For Convert to coordinate from address(address to Lat/Long)
                  const query = "Hochschulstraße 1, 83024 Rosenheim, Germany";
                  var _coordinates =
                      await Geocoder.local.findAddressesFromQuery(query);
                  var latLong = _coordinates.first;
                  print("Lat/Long : " +
                      _coordinates.first.coordinates.toString());

                  setState(() {
                    showAddress = first.addressLine.toString();
                  });
                },
                child: Text("Convert")),
          ],
        ),
      )),
    );
  }
}
