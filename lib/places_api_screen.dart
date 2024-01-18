import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class PlacesApiScreen extends StatefulWidget {
  const PlacesApiScreen({super.key});

  @override
  State<PlacesApiScreen> createState() => _PlacesApiScreenState();
}

class _PlacesApiScreenState extends State<PlacesApiScreen> {
  TextEditingController _controller = TextEditingController();

  var uuid = Uuid();
  String _sessionToken = "123456";
  List<dynamic> _placesList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      onChanged();
    });
  }

  void onChanged() {
    if (_sessionToken == null) {
      setState(() {
        _sessionToken = uuid.v4();
      });
    }

    getSugesstion(_controller.text);
  }

  // method for call api
  void getSugesstion(String input) async {
    String _kPlaces_Api_Key = "AIzaSyC7bsYGnPjDG2TmjORZXx1_ZO02hr08aPg";
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';

    String request =
        '$baseURL?input=$input&key=$_kPlaces_Api_Key&sessiontoken=$_sessionToken';
    var _uri = Uri.parse(request);
    var response = await http.get(_uri);
    var data = response.body.toString();
    print("Data");
    print(data);

    if (response.statusCode == 200) {
      setState(() {
        _placesList = jsonDecode(response.body.toString())['predictions'];
      });
    } else {
      throw Exception("request faild");
    }
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Places Api"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: _height * 0.023, horizontal: _width * 0.013),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: _width * 0.019, vertical: _height * 0.02),
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                    hintText: "Search Places",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: _placesList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(_placesList[index]['description']),
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
