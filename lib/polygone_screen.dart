import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolygoneScreen extends StatefulWidget {
  const PolygoneScreen({super.key});

  @override
  State<PolygoneScreen> createState() => _PolygoneScreenState();
}

class _PolygoneScreenState extends State<PolygoneScreen> {
  Completer<GoogleMapController> _controller = Completer();

  final CameraPosition _cameraPosition =
      const CameraPosition(target: LatLng(23.819029, 90.421222), zoom: 15);

  final Set<Marker> _markers = {};
  Set<Polygon> _polygoane = HashSet<Polygon>();

  List<LatLng> points = [
    LatLng(23.819029, 90.421222),
    LatLng(23.812113, 90.421687),
    LatLng(23.808212, 90.421831),
    LatLng(23.809098, 90.431397),
    LatLng(23.818046, 90.432400),
    LatLng(23.821651, 90.426918),
     LatLng(23.819029, 90.421222),
  ];

  @override
  void initState() {
    super.initState();

    _polygoane.add(
      Polygon(polygonId: PolygonId('1'),
      points: points,
      geodesic: true,
      fillColor: Colors.red.withOpacity(.3),
      strokeWidth: 4,
      strokeColor: Colors.red)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Polygone')),
      body: GoogleMap(
        initialCameraPosition: _cameraPosition,
        mapType: MapType.normal,
        myLocationButtonEnabled: true,
        myLocationEnabled: false,
        polygons: _polygoane,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
