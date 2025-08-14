import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hunting_app/application/hunts/model/hunts_model.dart';
import 'package:hunting_app/common/custom_button_with_svg.dart';
import 'package:hunting_app/common/custom_padding.dart';
import 'package:hunting_app/common/enum.dart';
import 'package:hunting_app/common/text_style_custom.dart';
import 'package:hunting_app/constant/app_colors.dart';
import 'package:hunting_app/constant/app_const.dart';
import 'package:hunting_app/presentation/home_screen/home_provider.dart';
import 'package:hunting_app/presentation/hunts/clam_price.dart';
import 'package:hunting_app/presentation/hunts/scan_success.dart';
import 'package:provider/provider.dart';

import '../../common/common.dart';
import 'qr_scanner.dart';

class Scan extends StatelessWidget {
  int? index;
  List<Clues> ? clues;
  Scan({super.key, this.index, this.clues});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff3B6074), Color(0xff0B2438), Color(0xff041119)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: [
              // Background image with opacity
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Opacity(
                  opacity: 0.1,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/splash_bg.png"),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
              ),
              vPad15,
              // Your content
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Column(
                  children: [
                    Image.asset("assets/splash_text_two.png"),
                    vPad20,
                    Text(
                      "SCAN ME",
                      style: customTextStyleAuth(
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    vPad20,
                    Stack(
                      children: [
                        SvgPicture.asset("assets/icon/square.svg"),
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Center(
                            child: SvgPicture.asset(
                              "assets/icon/circum_camera.svg",
                            ),
                          ),
                        ),
                      ],
                    ),
                    vPad20,
                    Text(
                      "Scan me for the next clue \nTo RS ${provider.selectedForDeatils!.prizeAmount.toString()}",
                      style: customTextStyleAuth(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: textLightColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    vPad50,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60.0),
                      child: CustomButtonWithSvg(
                        buttonText: "Scan QR Code",
                        svgIcon: "assets/icon/scan.svg",
                        color: blue3,
                        onPressed: () async {

                            final scannedCode = await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => QRViewExample(lastClue: clues![index!].isFinalClue!,  lat: clues![index!].qrCode!.latitude!.toDouble(), long: clues![index!].qrCode!.longitude!.toDouble(),num: index! + 1,)),
                          );
                          // Navigator.push(context, MaterialPageRoute(builder: (_)=> ScanSuccess()));
                          // Navigator.push(context, createSlideRoute(ScanSuccess()));
                          // data[index!].clues.last.status ==
                          //         ClueStatus.inProgress
                          //     ? Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //           builder: (_) => ClamPrice(),
                          //         ),
                          //       )
                          //     : Navigator.push(
                          //         context,
                          //         PageRouteBuilder(
                          //           transitionDuration: Duration(
                          //             milliseconds: 500,
                          //           ),
                          //           pageBuilder: (_, __, ___) =>
                          //               ScanSuccess(), // Replace with your target screen
                          //           transitionsBuilder:
                          //               (_, animation, __, child) {
                          //                 final offsetTween =
                          //                     Tween(
                          //                       begin: Offset(
                          //                         0.0,
                          //                         1.0,
                          //                       ), // Start from bottom
                          //                       end: Offset
                          //                           .zero, // End at center
                          //                     ).chain(
                          //                       CurveTween(
                          //                         curve: Curves.easeOutBack,
                          //                       ),
                          //                     );

                          //                 final fadeTween = Tween<double>(
                          //                   begin: 0.0,
                          //                   end: 1.0,
                          //                 );

                          //                 return SlideTransition(
                          //                   position: animation.drive(
                          //                     offsetTween,
                          //                   ),
                          //                   child: FadeTransition(
                          //                     opacity: animation.drive(
                          //                       fadeTween,
                          //                     ),
                          //                     child: child,
                          //                   ),
                          //                 );
                          //               },
                          //         ),
                          //       );

                        

                          // if (scannedCode != null) {
                          //   // Handle scanned QR code here (show dialog, navigate, etc.)
                          //   showDialog(
                          //     context: context,
                          //     builder: (_) => AlertDialog(
                          //       title: Text('QR Code Scanned'),
                          //       content: Text('Code: $scannedCode'),
                          //       actions: [
                          //         TextButton(
                          //           onPressed: () => Navigator.pop(context),
                          //           child: Text('OK'),
                          //         ),
                          //       ],
                          //     ),
                          //   );
                          // }
                        },
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
}
