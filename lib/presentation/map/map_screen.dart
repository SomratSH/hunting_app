import 'package:flutter/material.dart';
import 'package:hunting_app/common/custom_padding.dart';

import '../../common/text_style_custom.dart';
import '../../constant/app_colors.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    Expanded(
                      child: Text(
                        "All Clues",
                        style: customTextStyleAuth(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Divider(color: blueShade3),
                vPad15,
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset("assets/map_image_one.png"),
                ),
                vPad20,
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("assets/profile_image.jpg"),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      hPad15,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mike Rfaircxuju",
                            style: customTextStyleAuth(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "2.4 km - 46 min",
                            style: customTextStyleAuth(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'dart:async';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:hunting_app/common/custom_padding.dart';
// import 'package:hunting_app/constant/app_colors.dart';
// import 'package:hunting_app/common/text_style_custom.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'dart:ui' as ui;

// class MapScreen extends StatefulWidget {
//   const MapScreen({super.key});

//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   final Completer<GoogleMapController> _controller = Completer();

//   static const LatLng startPoint = LatLng(-26.2041, 28.0473); // Johannesburg
//   static const LatLng endPoint = LatLng(-26.192, 28.035); // Near Johannesburg
//   static const LatLng userPoint = LatLng(-26.198, 28.042); // App user location

//   Set<Marker> _markers = {};
//   Set<Polyline> _polylines = {};

//   @override
//   void initState() {
//     super.initState();
//     _setMarkersAndPolyline();
//   }

//   Future<void> _setMarkersAndPolyline() async {
//     final userIcon = await _createCustomMarker('assets/profile_image.jpg');

//     setState(() {
//       _markers = {
//         Marker(
//           markerId: MarkerId('start'),
//           position: startPoint,
//           infoWindow: InfoWindow(title: 'Start'),
//         ),
//         Marker(
//           markerId: MarkerId('end'),
//           position: endPoint,
//           infoWindow: InfoWindow(title: 'Destination'),
//         ),
//         Marker(
//           markerId: MarkerId('user'),
//           position: userPoint,
//           icon: userIcon,
//           infoWindow: InfoWindow(title: 'You'),
//         ),
//       };

//       _polylines = {
//         Polyline(
//           polylineId: PolylineId('route'),
//           points: [startPoint, userPoint, endPoint],
//           color: Colors.blueAccent,
//           width: 5,
//         )
//       };
//     });
//   }

//   Future<BitmapDescriptor> _createCustomMarker(String imagePath) async {
//     final Uint8List markerIcon =
//         await _getBytesFromAsset(imagePath, width: 80); // Resize image
//     return BitmapDescriptor.fromBytes(markerIcon);
//   }

//   Future<Uint8List> _getBytesFromAsset(String path, {required int width}) async {
//     final ByteData data = await rootBundle.load(path);
//     final codec = await ui.instantiateImageCodec(
//       data.buffer.asUint8List(),
//       targetWidth: width,
//     );
//     final fi = await codec.getNextFrame();
//     final byteData = await fi.image.toByteData(format: ui.ImageByteFormat.png);
//     return byteData!.buffer.asUint8List();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: appBgColor,
//       body: SafeArea(
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 IconButton(
//                   onPressed: () => Navigator.pop(context),
//                   icon: Icon(Icons.arrow_back, color: Colors.white),
//                 ),
//                 Expanded(
//                   child: Text(
//                     "Map View",
//                     style: customTextStyleAuth(
//                       fontSize: 17,
//                       fontWeight: FontWeight.w400,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ],
//             ),
//             Divider(color: blueShade3),
//             Expanded(
//               child: GoogleMap(
//                 initialCameraPosition: CameraPosition(
//                   target: startPoint,
//                   zoom: 13,
//                 ),
//                 markers: _markers,
//                 polylines: _polylines,
//                 myLocationEnabled: true,
//                 onMapCreated: (GoogleMapController controller) {
//                   _controller.complete(controller);
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Row(
//                 children: [
//                   Container(
//                     height: 50,
//                     width: 50,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       image: DecorationImage(
//                         image: AssetImage("assets/profile_image.jpg"),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   hPad15,
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Mike Rfaircxuju",
//                         style: customTextStyleAuth(
//                           fontSize: 17,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       Text(
//                         "2.4 km - 46 min",
//                         style: customTextStyleAuth(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
