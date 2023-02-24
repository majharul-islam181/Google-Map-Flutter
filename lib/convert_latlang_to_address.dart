// ignore_for_file: unused_local_variable, avoid_print, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:geocoding/geocoding.dart';

class ConvertLatLangToAddress extends StatefulWidget {
  const ConvertLatLangToAddress({super.key});

  @override
  State<ConvertLatLangToAddress> createState() =>
      _ConvertLatLangToAddressState();
}

class _ConvertLatLangToAddressState extends State<ConvertLatLangToAddress> {
  String stAddress = " ", stAdd = " ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Google Map".text.make(),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(stAddress),
          Text(stAdd),


          20.heightBox,
          GestureDetector(
            onTap: () async {
              List<Location> locations = await locationFromAddress("Gronausestraat 710, Enschede");
              List<Placemark> placemarks = await placemarkFromCoordinates(23.8191, 90.4526);

              setState(() {
                stAddress = locations.last.longitude.toString() + "   " +locations.last.longitude.toString();
                stAdd = placemarks.reversed.last.country.toString() + "  " +placemarks.reversed.last.locality.toString();
              });
            },
            child: "Convert"
                .text
                .make()
                .box
                .color(Colors.red)
                .padding(Vx.m16)
                .roundedSM
                .shadowMax
                .make()
                .centered(),
          ),
        ],
      ),
    );
  }
}
