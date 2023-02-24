// ignore_for_file: unused_field

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Completer<GoogleMapController> _completer = Completer();
  static const CameraPosition _cameraPosition =
      CameraPosition(target: LatLng(23.818968, 90.437371), zoom: 14.47);

  final List<Marker> _marker = [];
  final List<Marker> _list = [
    const Marker(
        markerId: MarkerId('1'),
        position: LatLng(23.818968, 90.437371),
        infoWindow: InfoWindow(title: "My Position 1")),
    const Marker(
        markerId: MarkerId('2'),
        position: LatLng(23.812068, 90.437371),
        infoWindow: InfoWindow(title: "My Position 2")),
    const Marker(
        markerId: MarkerId('3'),
        position: LatLng(23.818968, 90.434371),
        infoWindow: InfoWindow(title: "My Position 3")),
      

      const Marker(
        markerId: MarkerId('3'),
        position: LatLng(22.818968, 90.434371),
        infoWindow: InfoWindow(title: "My Position 3")),

  ];

  @override
  void initState() {
    super.initState();
    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
          mapType: MapType.normal,
          // myLocationEnabled: true,
          // compassEnabled: false,

          markers: Set<Marker>.of(_marker),
          
          initialCameraPosition: _cameraPosition,
          onMapCreated: (GoogleMapController controller) => _completer.complete(controller),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.location_disabled_outlined),
            onPressed: () async {
              GoogleMapController controller = await _completer.future;
              controller.animateCamera(CameraUpdate.newCameraPosition(
               const CameraPosition(target:LatLng(22.818968, 90.434371), zoom: 12)
              ));
            }),
      ),
    );
  }
}
