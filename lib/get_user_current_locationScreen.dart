// ignore_for_file: unused_field, prefer_interpolation_to_compose_strings, avoid_print, unused_local_variable

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetUserCurrentLocationScreen extends StatefulWidget {
  const GetUserCurrentLocationScreen({super.key});

  @override
  State<GetUserCurrentLocationScreen> createState() =>
      _GetUserCurrentLocationScreenState();
}

class _GetUserCurrentLocationScreenState
    extends State<GetUserCurrentLocationScreen> {
  //
  // google map instance
  final Completer<GoogleMapController> _controller = Completer();

  //
  // initial camera position
  static const CameraPosition _cameraPosition =
      CameraPosition(target: LatLng(33.6844, 73.0479), zoom: 14);

  // List of marker
  final List<Marker> _markers = <Marker>[
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(33.6844, 73.0479),
        infoWindow: InfoWindow(
          title: "The title of the marker",
        ))
  ];

  Future<Position> getUserCurrentLocations() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print("error" + error.toString());
    });

    return await Geolocator.getCurrentPosition();
  }



  /*

  // user redirect to their locations

  loadLocationFirst() {
    getUserCurrentLocations().then((value) async {
      print('my current location === > ');
      print(value.latitude.toString() + " " + value.longitude.toString());

      //
      // marker
      _markers.add(
        Marker(
            markerId: const MarkerId('2'),
            position: LatLng(value.latitude, value.longitude),
            infoWindow: const InfoWindow(
              title: 'My current location',
            )),
      );

      // after adding marker then change camera positions
      CameraPosition cameraPosition = CameraPosition(
          zoom: 14, target: LatLng(value.latitude, value.longitude));

      //last step controller
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

      setState(() {});
    });
  }


   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadLocationFirst();
  }


  */

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _cameraPosition,
        markers: Set<Marker>.of(_markers),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {


          // AIzaSyBq1XDMnxQMK8o0lTxrWhrX4UhBkL420kk


          ///////////// by pressing ////////////////
          getUserCurrentLocations().then((value) async {
            print('my current location === > ');
            print(value.latitude.toString() + " " + value.longitude.toString());

            //
            // marker
            _markers.add(
              Marker(
                  markerId: const MarkerId('2'),
                  position: LatLng(value.latitude, value.longitude),
                  infoWindow: const InfoWindow(
                    title: 'My current location',
                  )),   
            );

            // after adding marker then change camera positions
            CameraPosition cameraPosition = CameraPosition(
                zoom: 14, target: LatLng(value.latitude, value.longitude));

            //last step controller
            final GoogleMapController controller = await _controller.future;
            controller
                .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

            setState(() {});
          });

        },
        child: const Icon(Icons.local_activity),
      ),
    );
  }
}
