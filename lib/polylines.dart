// ignore_for_file: unused_field

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Polylines extends StatefulWidget {
  const Polylines({super.key});

  @override
  State<Polylines> createState() => _PolylinesState();
}

class _PolylinesState extends State<Polylines> {
  final Completer<GoogleMapController> _controller = Completer();

  final CameraPosition _cameraPosition =
      const CameraPosition(target: LatLng(23.819029, 90.421222), zoom: 15);

  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};

  List<LatLng> latlang = const [
    LatLng(23.819029, 90.421222),
    LatLng(23.809098, 90.431397),
  ];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < latlang.length; i++) {
      _markers.add(
        Marker(
            markerId: MarkerId(i.toString()),
            position: latlang[i],
            infoWindow: const InfoWindow(
                title: "Really cool place", snippet: "5 Star Rating"),
            icon: BitmapDescriptor.defaultMarker),
      );

      _polyline.add(
      Polyline(polylineId: const PolylineId('1'),
      points: latlang)
    );
    }

    setState(() {});

    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PolyLines')),
      body: GoogleMap(
        initialCameraPosition: _cameraPosition,
        markers: _markers,
        myLocationEnabled: true,
        mapType: MapType.normal,
        polylines: _polyline,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
