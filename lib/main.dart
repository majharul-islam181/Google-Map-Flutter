import 'package:flutter/material.dart';
// import 'package:googlemap/convert_latlang_to_address.dart';
// import 'package:googlemap/get_user_current_locationScreen.dart';
// import 'package:googlemap/google_place_api.dart';

import 'custom_marker_screen.dart';
// import 'package:googlemap/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData( 
      primarySwatch: Colors.blue,
      ),
      home: const CustomMarkerScreen(),
    );
  }
}

