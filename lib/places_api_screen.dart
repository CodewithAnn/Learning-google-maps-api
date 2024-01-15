import 'package:flutter/material.dart';

class PlacesApiScreen extends StatefulWidget {
  const PlacesApiScreen({super.key});

  @override
  State<PlacesApiScreen> createState() => _PlacesApiScreenState();
}

class _PlacesApiScreenState extends State<PlacesApiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Places Api"),
      ),
    );
  }
}
