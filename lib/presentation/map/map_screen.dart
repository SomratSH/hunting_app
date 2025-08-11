import 'dart:async';
import 'dart:convert';
import 'dart:typed_data'; // for Uint8List
import 'dart:math' as math;
import 'dart:ui';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hunting_app/common/custom_padding.dart';
import 'package:http/http.dart' as http;
import 'package:hunting_app/presentation/profile/profile_provider.dart';
import 'package:provider/provider.dart';
import '../../common/text_style_custom.dart';
import '../../constant/app_colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart' show rootBundle;

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  Set<Marker> markers = {};
  Set<Polyline> polylines = {};
  Set<Polygon> polygons = {};




  // Your API key here
  final String apiKey = 'AIzaSyDT0I4PgkqYzBiM7TKLfL3u_LmguZp3uUs';

  // Sample coordinates (adjust these to match your route)
  final LatLng sourceLocation = LatLng(
    23.8362,
    90.3728,
  ); // Example: Source location
  final LatLng destinationLocation = LatLng(
    23.8770,
    90.3770,
  ); // Example: Destination location

  @override
  void initState() {
    super.initState();
    _addMarkers();
    _getRoute();
_startLocationTracking();

    
  }
LatLng? currentLocation;
  bool isLoadingLocation = true;
  String locationStatus = "Getting location...";
  Timer? _locationTimer;
  bool _isLocationTrackingEnabled = true;
   Future<void> _getCurrentLocation() async {
    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(() {
          locationStatus = "Location services are disabled";
          isLoadingLocation = false;
        });
        // _showLocationDialog("Location services are disabled. Please enable location services.");
        return;
      }

      // Check location permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() {
            locationStatus = "Location permissions denied";
            isLoadingLocation = false;
          });
          // _showLocationDialog("Location permissions are denied");
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        setState(() {
          locationStatus = "Location permissions permanently denied";
          isLoadingLocation = false;
        });
        // _showLocationDialog("Location permissions are permanently denied. Please enable them in settings.");
        return;
      }

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        currentLocation = LatLng(position.latitude, position.longitude);
        isLoadingLocation = false;
        locationStatus = "Lat: ${position.latitude.toStringAsFixed(6)}, Lng: ${position.longitude.toStringAsFixed(6)}";
      });

      print("Current Location: Latitude: ${position.latitude}, Longitude: ${position.longitude}");
      
      // Add markers after getting location
      _addMarkers();
      

      // Move camera to current location
      if (mapController != null) {
        mapController.animateCamera(
          CameraUpdate.newLatLng(currentLocation!),
        );
      }

    } catch (e) {
      setState(() {
        locationStatus = "Error getting location: $e";
        isLoadingLocation = false;
      });
      print("Error getting location: $e");
    }
  }
void _startLocationTracking() {
    _locationTimer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (_isLocationTrackingEnabled) {
        _getCurrentLocation();
      }
    });
  }
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _addMarkers() async {
    final provider = context.read<ProfileProvider>();

    // Fetch the profile image from the network and create a BitmapDescriptor
    final BitmapDescriptor customIcon = await _getMarkerIcon(
      provider.profileModel.data!.image.toString(),
    );
     markers.add(
        Marker(
          markerId: MarkerId('current_location'),
          position: currentLocation!,
          infoWindow: InfoWindow(
            title: 'My Current Location',
            snippet: 'Live Position',
          ),
          icon: customIcon,
          onTap: () {
            print('Current location marker tapped!');
           
          },
        ),
      );

    markers.add(
      Marker(
        markerId: MarkerId('source'),
        position: sourceLocation,
        infoWindow: InfoWindow(
          title: 'Source',
          snippet: 'Starting Point',
        ),
        icon: customIcon, // Use custom network image as the source marker
      ),
    );

    markers.add(
      Marker(
        markerId: MarkerId('destination'),
        position: destinationLocation,
        infoWindow: InfoWindow(title: 'Destination', snippet: 'End Point'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
    );
  }

  Future<BitmapDescriptor> _getMarkerIcon(String imageUrl) async {
    try {
      // Fetch the image from the network as bytes
      final response = await http.get(Uri.parse(imageUrl));

      if (response.statusCode == 200) {
        // Convert the image to bytes
        final Uint8List bytes = response.bodyBytes;

        // Create a circular BitmapDescriptor from the image bytes
        return await _getCircularMarkerIcon(bytes);
      } else {
        print('Failed to load image: ${response.statusCode}');
        return BitmapDescriptor.defaultMarker;
      }
    } catch (e) {
      print('Error loading marker icon: $e');
      return BitmapDescriptor.defaultMarker;
    }
  }

  Future<BitmapDescriptor> _getCircularMarkerIcon(Uint8List bytes) async {
    try {
      // Load the image as a ui.Image
      final ui.Image image = await _loadImage(bytes);

      const int markerSize = 150;
      const double radius = markerSize / 2;

      // Create a picture recorder and canvas
      final recorder = ui.PictureRecorder();
      final canvas = ui.Canvas(
        recorder,
        Rect.fromLTWH(0, 0, markerSize.toDouble(), markerSize.toDouble()),
      );

      // Create paint for the border
      final borderPaint = ui.Paint()
        ..color = primaryColor
        ..style = ui.PaintingStyle.fill
        ..isAntiAlias = true;

      // Create paint for the image
      final imagePaint = ui.Paint()..isAntiAlias = true;

      // Draw white background circle (border effect)
      canvas.drawCircle(
        Offset(radius, radius),
        radius,
        borderPaint,
      );

      // Create circular clipping path for the image
      final clipPath = Path()
        ..addOval(Rect.fromCircle(
          center: Offset(radius, radius),
          radius: radius - 4, // Slightly smaller for border effect
        ));

      canvas.clipPath(clipPath);

      // Calculate the scale to fit the image in the circle
      final double imageSize = radius * 2 - 8; // Account for border
      final srcRect = Rect.fromLTWH(
        0,
        0,
        image.width.toDouble(),
        image.height.toDouble(),
      );
      final dstRect = Rect.fromLTWH(
        4, // Offset for border
        4, // Offset for border
        imageSize,
        imageSize,
      );

      // Draw the image
      canvas.drawImageRect(image, srcRect, dstRect, imagePaint);

      // Get the picture and convert it to an image
      final picture = recorder.endRecording();
      final img = await picture.toImage(markerSize, markerSize);

      // Convert the image to bytes
      final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
      final uint8List = byteData!.buffer.asUint8List();

      return BitmapDescriptor.fromBytes(uint8List);
    } catch (e) {
      print('Error creating circular marker: $e');
      return BitmapDescriptor.defaultMarker;
    }
  }

  // Helper method to load the image from bytes
  Future<ui.Image> _loadImage(Uint8List bytes) async {
    final Completer<ui.Image> completer = Completer();
    ui.decodeImageFromList(bytes, (ui.Image img) {
      completer.complete(img);
    });
    return completer.future;
  }

  String duration = "N/A";
  String distance = "N/A";

  Future<void> _getRoute() async {
    final String url =
        'https://maps.googleapis.com/maps/api/directions/json?'
        'origin=${sourceLocation.latitude},${sourceLocation.longitude}&'
        'destination=${destinationLocation.latitude},${destinationLocation.longitude}&'
        'key=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['routes'].isNotEmpty) {
          final route = data['routes'][0];
          final polylinePoints = route['overview_polyline']['points'];
          final List<LatLng> routeCoords = _decodePolyline(polylinePoints);

          // Get duration and distance
          duration = route['legs'][0]['duration']['text'];
          distance = route['legs'][0]['distance']['text'];

          setState(() {
            polylines.add(
              Polyline(
                polylineId: PolylineId('route'),
                points: routeCoords,
                color: Colors.blue,
                width: 5,
              ),
            );
          });

          // Show route info
          _showRouteInfo(duration, distance);
        }
      }
    } catch (e) {
      print('Error getting route: $e');
    }
  }

  List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> points = [];
    int index = 0;
    int len = encoded.length;
    int lat = 0;
    int lng = 0;

    while (index < len) {
      int b;
      int shift = 0;
      int result = 0;

      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);

      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;

      shift = 0;
      result = 0;

      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);

      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      points.add(LatLng(lat / 1E5, lng / 1E5));
    }
    return points;
  }

  void _showRouteInfo(String duration, String distance) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.all(20),
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.route, color: Colors.blue, size: 24),
                SizedBox(width: 10),
                Text(
                  'Route Information',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Icon(Icons.access_time, color: Colors.grey[600], size: 20),
                SizedBox(width: 8),
                Text(duration, style: TextStyle(fontSize: 16)),
                SizedBox(width: 20),
                Icon(Icons.straighten, color: Colors.grey[600], size: 20),
                SizedBox(width: 8),
                Text(distance, style: TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProfileProvider>();
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
                    Expanded(
                      child: Text(
                        "Tracking Location",
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
                  child: Container(
                    height: 500,
                    width: double.infinity,
                    child: GoogleMap(
                      onMapCreated: _onMapCreated,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                          sourceLocation.latitude 
                              ,
                          sourceLocation.longitude 
                              ,
                        ),
                        zoom: 10.0,
                      ),
                      markers: markers,
                      polylines: polylines,
                      polygons: polygons,
                      mapType: MapType.normal,
                      // myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                      zoomControlsEnabled: true,
                    ),
                  ),
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
                            image: NetworkImage(
                              provider.profileModel.data!.image.toString(),
                            ),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      hPad15,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            provider.profileModel.data!.name.toString(),
                            style: customTextStyleAuth(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "$distance - $duration",
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