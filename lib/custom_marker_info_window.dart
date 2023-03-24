import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMarkerInfoWindow extends StatefulWidget {
  const CustomMarkerInfoWindow({super.key});

  @override
  State<CustomMarkerInfoWindow> createState() => _CustomMarkerInfoWindowState();
}

class _CustomMarkerInfoWindowState extends State<CustomMarkerInfoWindow> {
  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  final List<Marker> _markers = <Marker>[];

  final List<LatLng> _latlang = <LatLng>[
    const LatLng(33.6941, 72.9734),
    const LatLng(33.7008, 72.9682),
    const LatLng(33.6992, 72.9744),
    const LatLng(33.6939, 72.9771),
    const LatLng(33.6910, 72.9807),
    const LatLng(33.7036, 72.9785),
  ];

  @override
  void initState() {
    super.initState();

    loadData();
  }

  void loadData() {
    for (int i = 0; i < _latlang.length; i++) {
      _markers.add(
        Marker(
          markerId: MarkerId(i.toString()),
          icon: BitmapDescriptor.defaultMarker,
          position: _latlang[i],
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              Container(
                height: 300,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),

                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 300,
                      height: 100,
                      decoration:const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
                            
                          ),
                          fit: BoxFit.fitWidth,
                          filterQuality: FilterQuality.high,
                        
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                      ),
                    ),


                    // 

                    Padding(padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                    
                    child: Row(
                      children: const [
                        SizedBox(
                          width: 100,
                           child: Text('Beef Tocas', maxLines: 1,
                           overflow: TextOverflow.fade,
                           softWrap: false,
                           ),
                        ),
                       Spacer(),
                        Text(
                          '.3 mi',

                        )
                      ],
                    ),
                    
                    
                    ),
                    const Padding(padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                    child: Text('Help me finish these tocas! I got aplatter from costco and its too much',
                    maxLines: 2,),)

                  ],
                ),
              ), 
              _latlang[i]);
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Info Window Example'),
        backgroundColor: Colors.red,
      ),
      body: Stack(
        children: [ 
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(33.6941, 72.9734),
              zoom: 15,
            ),
            markers: Set<Marker>.of(_markers),
            onTap: (position) {
              _customInfoWindowController.hideInfoWindow!();
            },
            onCameraMove: (position) {
              _customInfoWindowController.onCameraMove!();
            },
            onMapCreated: (GoogleMapController controller) {
              _customInfoWindowController.googleMapController = controller;
            },
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 200,
            width: 300,
            offset: 35,
          )
        ],
      ),
    );
  }
}
