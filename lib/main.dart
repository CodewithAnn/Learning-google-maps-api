import 'package:flutter/material.dart';
import 'package:google_maps_api/home_Page.dart';
import 'package:google_maps_api/lat_long_convert.dart';
import 'package:google_maps_api/places_api_screen.dart';
import 'package:google_maps_api/user_current_location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PlacesApiScreen(),
    );
  }
}
