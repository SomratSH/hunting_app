import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hunting_app/common/custom_padding.dart';
import 'package:hunting_app/constant/app_colors.dart';
import 'package:hunting_app/presentation/hunts/scan.dart';

import '../../common/enum.dart';
import '../../common/text_style_custom.dart';
import '../../constant/app_const.dart';

// ignore: must_be_immutable
class CluesScreen extends StatefulWidget {
  int ?index;
  CluesScreen({super.key, this.index});

  @override
  State<CluesScreen> createState() => _CluesScreenState();
}

class _CluesScreenState extends State<CluesScreen> {
  bool isHint = false;


  @override
  Widget build(BuildContext context) {
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
                          "Clue 1 of ${data[widget.index!].clues.length}",
                          style: customTextStyleAuth(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "\"${data[widget.index!].title}\"",
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: 
                  List.generate(data[widget.index!].clues.length, (i) {
      final step = data[widget.index!].clues[i];
      return _buildProgressStep(i+1, step.title, step.status);
    }),
                  
                  // [
                  //   _buildProgressStep(1, 'The Secret St...', true),
                  //   _buildProgressStep(2, 'Hidden Trea...', true),
                  //   _buildProgressStep(3, 'Final Goal', false),
                  // ],
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
            Icon(Icons.location_on, color: Colors.white, size: 20),
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

      Container(
        height: 200,
        width: double.infinity,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage("assets/clues_pic.png"),
            fit: BoxFit.fill,
          ),
        ),
      ),

      Container(
        width: double.infinity,

        decoration: BoxDecoration(
          color: card1,
          borderRadius: BorderRadius.circular(10),
        ),

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "“Where smoke rises and meat is king,\n\nYour next step lies near Braaifesta's swing.\n\nFollow the aroma, trust your nose,\n\nWhere community gathers, the secret shows.\n\nLook for the place where flames dance high,\n\nAnd laughter echoes to the sky.”",
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
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/map_image.png"),
                            fit: BoxFit.cover,
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
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                      'Johannesburg Expo Centre, Nasrec',
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
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                        padding: EdgeInsets.symmetric(vertical: 14),
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
                        padding: EdgeInsets.symmetric(vertical: 14),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          padding: const EdgeInsets.only(left: 28.0),
                          child: Text(
                            "Look for the annual food festival where\nSouth African braai culture comes alive.",
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

            Navigator.push(context, MaterialPageRoute(builder: (_)=> Scan(
                index:widget.index!
            )));
          },
          icon: Icon(Icons.qr_code_scanner, color: Colors.white),
          label: Text(
            'Scan QR Code',
            style: TextStyle(color: Colors.white),
          ),
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.white),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),

    ],
  ),
)


            ],
          ),
        ),
      ),
    );
  }


Widget _buildProgressStep(int number, String label, ClueStatus status) {
  Color getStatusColor() {
    switch (status) {
      case ClueStatus.completed:
        return textLightColor;
      case ClueStatus.inProgress:
        return blue3;
      case ClueStatus.locked:
      default:
        return const Color.fromARGB(255, 143, 143, 143);
    }
  }

  Widget getStatusIcon() {
    switch (status) {
      case ClueStatus.completed:
      return Icon(Icons.check_box, color: Colors.green, );
      case ClueStatus.inProgress:
        return Text(
          number.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        );
      case ClueStatus.locked:
      default:
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
            child: Center(
              child: getStatusIcon(),
            ),
          ),
          number != 3
              ? Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(height: 1, color: text2, width: 50),
                )
              : const SizedBox.shrink(),
        ],
      ),
      vPad5,
      Text(
        label,
        style: TextStyle(
          color: status == ClueStatus.locked ? Colors.grey[400] : Colors.white,
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
