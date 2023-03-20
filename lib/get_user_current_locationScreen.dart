// ignore_for_file: unused_field

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetUserCurrentLocationScreen extends StatefulWidget {
  const GetUserCurrentLocationScreen({super.key});

  @override
  State<GetUserCurrentLocationScreen> createState() =>
      _GetUserCurrentLocationScreenState();
}

class _GetUserCurrentLocationScreenState extends State<GetUserCurrentLocationScreen> {
  final Completer<GoogleMapController> _completer = Completer();

  static const CameraPosition _cameraPosition = CameraPosition(target: LatLng(33.6844, 73.0479), zoom: 14);

  final List<Marker> _list = const <Marker>[
    Marker(
    markerId: MarkerId('1'),
    position: LatLng(33.6844, 73.0479),
    infoWindow: InfoWindow(
      title: "The title of the marker",
    ))
  ];

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
