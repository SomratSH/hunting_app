import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hunting_app/constant/app_colors.dart';
import 'package:hunting_app/presentation/hunts/scan_failed.dart';
import 'package:hunting_app/presentation/hunts/scan_success.dart';

import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class QRViewExample extends StatefulWidget {
  final double lat;
  final double long;

  const QRViewExample({super.key, required this.lat, required this.long});

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool scanned = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _requestPermission();
  }

  Future<void> _requestPermission(double lat, double lon) async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      print("Permission Denied. Cannot access location.");
      // setState(() {
      //   _locationStatus = 'Permission Denied. Cannot access location.';
      // });
    } else {
      checkLocation(lat,lon);
    }
  }

  void checkLocation(double qrLat, double qrLot) async {
    // Get the current position (latitude and longitude)
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    double currentLat = position.latitude;
    double currentLon = position.longitude;

    // Calculate the distance between the fixed point and the current location
    double distance = calculateDistance(
      qrLat,
      qrLot,
      currentLat,
      currentLon,
    );

    // Check if the distance is within 15 meters
    if (distance <= 100) {
      print('===>>>> You are within 15 meters of the target location!');
       Navigator.push(context, MaterialPageRoute(builder: (_)=> ScanSuccess()));
       
      // setState(() {
      //   _locationStatus = 'You are within 15 meters of the target location!';
      // });
    } else {
      print(
        '===>>>> You are more than 15 meters away from the target location.',
      );
       Navigator.push(context, MaterialPageRoute(builder: (_)=> ScanFailed()));
      // setState(() {
      //   // _locationStatus = 'You are more than 15 meters away from the target location.';
      // });
    }
  }

  // Latitude: 23.7808265, Longitude: 90.4075629
  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const double R = 6371000; // Radius of Earth in meters
    double phi1 = lat1 * (3.141592653589793 / 180); // Convert to radians
    double phi2 = lat2 * (3.141592653589793 / 180); // Convert to radians
    double deltaPhi = (lat2 - lat1) * (3.141592653589793 / 180);
    double deltaLambda = (lon2 - lon1) * (3.141592653589793 / 180);

    double a =
        (sin(deltaPhi / 2) * sin(deltaPhi / 2)) +
        (cos(phi1) * cos(phi2) * sin(deltaLambda / 2) * sin(deltaLambda / 2));
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    double distance = R * c; // Result in meters

    return distance;
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController ctrl) {
    this.controller = ctrl;
    ctrl.scannedDataStream.listen((scanData) {
      if (!scanned) {
        scanned = true;
        _extractData(scanData.code.toString());
       ; // Return scanned code
      }
    });
  }

void _extractData(String data) {
    // Regular expression to extract QR Code, lat and lon
    // RegExp regExp = RegExp(r"Code:\s*(\S+)\s*- lat:\s*([0-9.-]+),\s*lon:\s*([0-9.-]+)");
    RegExp regExp = RegExp(r"Code:\s*(\S+)\s*-\s*lat:\s*([0-9.-]+)\s*,\s*lon:\s*([0-9.-]+)");
    Match? match = regExp.firstMatch(data);

    if (match != null) {
      // Extract QRCODE, lat and lon values
      String extractedQRCode = match.group(1)!;
      String latString = match.group(2)!;
      String lonString = match.group(3)!;

      print( "=====///"+extractedQRCode);
      print(  "=====///"+latString);
      print(  "=====///"+lonString);

      _requestPermission(double.parse(latString), double.parse(lonString));
      // setState(() {
      //   qrCode = extractedQRCode; // Store the QR code value
      //   latitude = double.tryParse(latString); // Store latitude
      //   longitude = double.tryParse(lonString); // Store longitude
      // });
    } else {
      // If the data doesn't match the expected format
      // setState(() {
      //   qrCode = null;
      //   latitude = null;
      //   longitude = null;
      // });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
        child: Column(
          children: [
            // Top app bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  Expanded(
                    child: Text(
                      "Scan QR Code",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(width: 48), // Placeholder to balance the back button
                ],
              ),
            ),
            Divider(color: Color(0xff264A5F)),

            // QR scanner area
            Expanded(
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(
                  borderColor: Colors.blueAccent,
                  borderRadius: 10,
                  borderLength: 30,
                  borderWidth: 10,
                  cutOutSize: 300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
