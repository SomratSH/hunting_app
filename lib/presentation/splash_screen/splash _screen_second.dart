import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hunting_app/common/custom_padding.dart';
import 'package:hunting_app/common/text_style_custom.dart' show customTextStyle;
import 'package:hunting_app/constant/app_colors.dart';
import 'package:hunting_app/presentation/authentication/login_screen.dart';
import 'package:hunting_app/presentation/landing_page/landing_page.dart';

class SplashScreenSecond extends StatefulWidget {
  const SplashScreenSecond({super.key});

  @override
  State<SplashScreenSecond> createState() => _SplashScreenSecondState();
}

class _SplashScreenSecondState extends State<SplashScreenSecond> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashColor,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset("assets/splash_bg_two.png"),
               Positioned(
                top: 80,
                left: 50,
                child:  Image.asset("assets/splash_text_two.png", height: 100))
              ],
            ),
           vPad20,
            Text("CHASE THE\nCASH SA", style: GoogleFonts.roboto(
              fontWeight: FontWeight.w700,
              fontSize: 24, 
              color: Colors.white
            ),
            textAlign: TextAlign.center,
            ),
           vPad20,
            Text("CHASE THE CASH SA is a real-\nworld treasure hunt mobile app\nwhere players subscribe to access\nclue-based cash hunts.", 
            textAlign: TextAlign.center,
            style: customTextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400
            ),),
        
          vPad15,
          InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_)=> LoginScreen())),
            child: Container(
              decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Start Hunt", style: customTextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),),
              ),
            ),
          ),
                   Spacer(),
               
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: LinearGradient(
              colors: [
                Color(0xff091B27), // Dark blue
                Color(0xff2A4D61), // Lighter blue
              ],
             
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Adjusting the image size and alignment
              Image.asset(
                "assets/splash_two_card.png",
                height: 170,
                fit: BoxFit.cover, // Ensures the image covers the space proportionally
              ),
              // Column for text and button
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "ACTIVE CASH\nHUNTING",
                      textAlign: TextAlign.center,
                      style: customTextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                    ),
                    SizedBox(height: 10), // Spacer between text and button
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: Color(0xff14191F),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Scan QR Code",
                          style: customTextStyle(fontWeight: FontWeight.w700, fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
               
          ],
        ),
      ),
    );
  }
}