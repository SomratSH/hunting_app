import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hunting_app/application/hunts/model/hunts_model.dart';
import 'package:hunting_app/common/custom_padding.dart';
import 'package:hunting_app/constant/app_colors.dart';
import 'package:hunting_app/presentation/home_screen/home_provider.dart';
import 'package:hunting_app/presentation/home_screen/widget/custom%20_card.dart';
import 'package:hunting_app/presentation/hunts/scan.dart';
import 'package:geocoding/geocoding.dart';
import 'package:provider/provider.dart';
import '../../common/enum.dart';
import '../../common/text_style_custom.dart';
import '../../constant/app_const.dart';

// ignore: must_be_immutable
class CluesScreen extends StatefulWidget {
  List<Clues>? clues;
  int? index;
  CluesScreen({super.key, this.index, this.clues});

  @override
  State<CluesScreen> createState() => _CluesScreenState();
}

class _CluesScreenState extends State<CluesScreen> {
  bool isHint = false;
  final Set<Circle> _circles = Set();
  void _addCircle() {
    final clue = widget.clues![widget.index!];
    final LatLng position = LatLng(
      clue.qrCode!.latitude!.toDouble(),
      clue.qrCode!.longitude!.toDouble(),
    );

    _circles.add(
      Circle(
        circleId: CircleId('clue_circle'),
        center: position,
        radius: 18, // 15 meters
        // fillColor: Colors.blue.withOpacity(0.2), // Circle fill color
        strokeColor: Colors.blue, // Circle border color
        strokeWidth: 2, // Circle border width
      ),
    );
  }

  String _address = "Fetching address...";

  // Function to get address from coordinates
  Future<void> _getAddress() async {
    final clue = widget.clues![widget.index!];
    final latitude = clue.qrCode!.latitude!.toDouble();
    final longitude = clue.qrCode!.longitude!.toDouble();

    try {
      // Get the address from the coordinates
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latitude,
        longitude,
      );
      if (placemarks.isNotEmpty) {
        // Get the first placemark
        Placemark placemark = placemarks[0];
        setState(() {
          // Concatenate address components
          _address =
              "${placemark.name}, ${placemark.locality}, ${placemark.country}";
        });
      }
    } catch (e) {
      setState(() {
        _address = "Failed to get address";
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _addCircle();
    _getAddress();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    return Scaffold(
      backgroundColor: appBgColor,

      body: SafeArea(
        child: SingleChildScrollView(
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
                    child: Column(
                      children: [
                        Text(
                          "Clue ${widget.index! + 1} of ${widget.clues!.length}",
                          style: customTextStyleAuth(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "\"${truncateText(widget.clues![widget.index!].name.toString(), 30)}\"",
                          style: customTextStyleAuth(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: textLightColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icon/time.svg"),
                        hPad5,
                        Text(
                          "22:34",
                          style: customTextStyleAuth(
                            color: text2,
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(color: Color(0xff264A5F)),

              // Progress indicators
              Padding(
                padding: EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(widget.clues!.length, (i) {
                      final step = widget.clues![i];
                      return _buildProgressStep(
                        i + 1,
                        step.name.toString(),
                        step.status.toString(),
                      );
                    }),

                    // [
                    //   _buildProgressStep(1, 'The Secret St...', true),
                    //   _buildProgressStep(2, 'Hidden Trea...', true),
                    //   _buildProgressStep(3, 'Final Goal', false),
                    // ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    // Location Challenge Header
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Location Challenge',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Container(
                    //   height: 200,
                    //   width: double.infinity,

                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     image: DecorationImage(
                    //       image: AssetImage("assets/clues_pic.png"),
                    //       fit: BoxFit.fill,
                    //     ),
                    //   ),
                    // ),
                    Container(
                      width: double.infinity,

                      decoration: BoxDecoration(
                        color: card1,
                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${widget.clues![widget.index!].hint}",
                          style: customTextStyleAuth(
                            color: textLightColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    vPad15,
                    // Target Location
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: card1,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 24),

                          // Title
                          Text(
                            'Target Location',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Map Container
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: Container(
                              height: 200,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 8,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Stack(
                                  children: [
                                    // Map Background
                                    Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: GoogleMap(
                                        mapType: MapType.satellite,
                                        circles: _circles,
                                        markers: {
                                          Marker(
                                            markerId: MarkerId('clue_marker'),
                                            position: LatLng(
                                              widget
                                                  .clues![widget.index!]
                                                  .qrCode!
                                                  .latitude!
                                                  .toDouble(),
                                              widget
                                                  .clues![widget.index!]
                                                  .qrCode!
                                                  .longitude!
                                                  .toDouble(),
                                            ),
                                            infoWindow: InfoWindow(
                                              title: 'Clue Location',
                                              snippet: 'Find the clue here',
                                            ),
                                          ),
                                        },

                                        initialCameraPosition: CameraPosition(
                                          zoom: 18,

                                          target: LatLng(
                                            widget
                                                .clues![widget.index!]
                                                .qrCode!
                                                .latitude!
                                                .toDouble(),
                                            widget
                                                .clues![widget.index!]
                                                .qrCode!
                                                .longitude!
                                                .toDouble(),
                                          ),
                                        ),
                                      ),
                                    ),

                                    // Location Icon Overlay
                                    Positioned.fill(
                                      child: Center(
                                        child: SvgPicture.asset(
                                          "assets/icon/tdesign_location.svg",
                                          width: 24,
                                          height: 24,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Location Details
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.red,
                                  size: 18,
                                ),
                                const SizedBox(width: 8),
                                Flexible(
                                  child: Text(
                                    _address,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Action Buttons
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      isHint = !isHint;
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      Icons.lightbulb_outline,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                    label: Text(
                                      'Need a Hint?',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: buttonColor,
                                      foregroundColor: Colors.white,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 14,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      elevation: 2,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      // Add your map opening logic here
                                    },
                                    icon: Icon(
                                      Icons.map,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                    label: Text(
                                      'Open Map',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: buttonColor,
                                      foregroundColor: Colors.white,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 14,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      elevation: 2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Hint Section
                          if (isHint)
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: textLightColor,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: blue2.withOpacity(0.3),
                                    width: 1,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            "assets/icon/lightbulb.svg",
                                            width: 20,
                                            height: 20,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            "Hint",
                                            style: customTextStyleAuth(
                                              color: blue2,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 12),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 28.0,
                                        ),
                                        child: Text(
                                          widget.clues![widget.index!].hint
                                              .toString(),
                                          style: customTextStyleAuth(
                                            color: blue2,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    vPad15,

                    // Location info

                    // QR Code scan button
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: buttonColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.all(16),
                      child: OutlinedButton.icon(
                        onPressed: () {
                          print(widget.index);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => Scan(
                                index: widget.index!,
                                clues: widget.clues,
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.qr_code_scanner, color: Colors.white),
                        label: Text(
                          'Scan QR Code',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.white),
                          padding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 24,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressStep(int number, String label, String status) {
    Color getStatusColor() {
      if (status == ClueStatus.completed.name.toString()) {
        return textLightColor;
      } else if (status == ClueStatus.pending.name.toString()) {
        return blue3;
      } else if (status == ClueStatus.inProgress.name.toString()) {
        return blue3;
      } else if (status == ClueStatus.locked.name.toString()) {
        return const Color.fromARGB(255, 143, 143, 143);
      } else {
        return const Color.fromARGB(255, 143, 143, 143);
      }
    }

    Widget getStatusIcon() {
      if (status == ClueStatus.completed.name.toString()) {
        return Icon(Icons.check_box, color: Colors.green);
        
      } else if (status == ClueStatus.pending.name.toString() ||
          status == ClueStatus.inProgress.name.toString()) {
        return Text(
          number.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        );
      } else if (status == ClueStatus.locked.name.toString()) {
        return SvgPicture.asset("assets/icon/lock.svg");
      } else {
       return SvgPicture.asset("assets/icon/lock.svg");
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: getStatusColor(),
                shape: BoxShape.circle,
              ),
              child: Center(child: getStatusIcon()),
            ),
            number != 3
                ? Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(height: 1, color: text2, width: 50),
                  )
                : const SizedBox.shrink(),
          ],
        ),
        vPad10,
        Text(
          truncateText(label.toString(), 10),
          style: TextStyle(
            color: status == ClueStatus.locked.toString()
                ? Colors.grey[400]
                : Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  // Widget _buildProgressStep(int number, String label, bool isActive,) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Row(
  //         children: [
  //           Container(
  //             width: 40,
  //             height: 40,
  //             decoration: BoxDecoration(
  //               color: isActive
  //                   ? blue3
  //                   : const Color.fromARGB(255, 143, 143, 143),
  //               shape: BoxShape.circle,
  //             ),
  //             child: Center(
  //               child: isActive
  //                   ? Text(
  //                       number.toString(),
  //                       style: TextStyle(
  //                         color: Colors.white,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     )
  //                   : SvgPicture.asset("assets/icon/lock.svg"),
  //             ),
  //           ),
  //           number != 3
  //               ? Padding(
  //                   padding: const EdgeInsets.only(left: 8.0),
  //                   child: Container(height: 1, color: text2, width: 50),
  //                 )
  //               : SizedBox.shrink(),
  //         ],
  //       ),
  //       vPad5,
  //       Text(
  //         label,
  //         style: TextStyle(
  //           color: isActive ? Colors.white : Colors.grey[400],
  //           fontSize: 12,
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
