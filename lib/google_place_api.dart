// ignore_for_file: non_constant_identifier_names, unused_local_variable, unused_import, unnecessary_null_comparison, avoid_print

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class GooglePlaceApiScreen extends StatefulWidget {
  const GooglePlaceApiScreen({super.key});

  @override
  State<GooglePlaceApiScreen> createState() => _GooglePlaceApiScreenState();
}

class _GooglePlaceApiScreenState extends State<GooglePlaceApiScreen> {
  final TextEditingController _controller = TextEditingController();
  var uuid = const Uuid(); // getting device id
  String _sessiontoken = "123456";

  List<dynamic> _placeList = [];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      onChange();
    });
  }

  void onChange() {
    if (_sessiontoken == null) {
      setState(() {
        _sessiontoken = uuid.v4();
      });
    }

    getSuggestion(_controller.text);
  }

  getSuggestion(String input) async {
 
    String kPLACES_API_KEY = "AIzaSyBq1XDMnxQMK8o0lTxrWhrX4UhBkL420kk";
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request =
        '$baseURL?input=$input&key=$kPLACES_API_KEY&sessiontoken=$_sessiontoken';

    var response = await http.get(Uri.parse(request));

    print(response.body.toString());

    if (response.statusCode == 200) {
      setState(() {
        _placeList = jsonDecode(response.body.toString())['predictions'];
      });
    } else {
      throw Exception("failed to load data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(elevation: 0, title: const Text('Google Search Places Api')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: _controller,
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                hintText: "Search Places with name",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
