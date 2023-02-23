// ignore_for_file: unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:velocity_x/velocity_x.dart';



class ConvertLatLangToAddress extends StatefulWidget {
  const ConvertLatLangToAddress({super.key});

  @override
  State<ConvertLatLangToAddress> createState() =>
      _ConvertLatLangToAddressState();
}

class _ConvertLatLangToAddressState extends State<ConvertLatLangToAddress> {
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


          GestureDetector(
            onTap: () async {
              final coordinates = Coordinates(23.818968, 90.434371);
              var address = await Geocoder.local.findAddressesFromCoordinates(coordinates);

              var first = address.first;
              print("Address:  ${first.featureName}${first.addressLine}");
            },
          ),




          "Convert"
              .text
              .make()
              .box
              .color(Colors.red)
              .padding(Vx.m16)
              .roundedSM
              .shadowMax
              .make()
              .centered(),
          //   const  VxResponsive(
          //   xsmall: Text("Hi d Small"),
          //   small: Text("Hi Small"),
          //   medium: Text("Hi Medium"),
          //   large: Text("Hi Large"),
          //   xlarge: Text("Hi Extra Large"),
          //   fallback: Text("Hi Nothing Specified"),
          // ),
          // 20.heightBox,





        ],
      ),
    );
  }
}
