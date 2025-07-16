import 'package:flutter/material.dart';
import 'package:hunting_app/common/custom_button.dart';
import 'package:hunting_app/common/custom_padding.dart';
import 'package:hunting_app/common/text_style_custom.dart';
import 'package:hunting_app/constant/app_colors.dart';
import 'package:hunting_app/presentation/landing_page/landing_page.dart';

class ScanSuccess extends StatelessWidget {
  const ScanSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(child: Column(
        children: [ 
          vPad10,
          Image.asset("assets/splash_text_two.png"),
          Divider(color: blueShade3,),
          vPad50,
         Stack(
  clipBehavior: Clip.none, // Allow Positioned to overflow outside the stack
  children: [
    Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xff111827),
        border: Border.all(color: textLightColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          vPad70,// Spacer for the floating image
          Text(
            "Congratulations!",
            style: customTextStyleAuth(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: const Color(0xffF5C444),
            ),
          ),
          vPad10,
          Text(
            "QR Code Successfully Matched",
            style: customTextStyleAuth(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: textLightColor,
            ),
          ),
          vPad20,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: appBgColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.check_box, color: Colors.green),
                        hPad10,
                        Text(
                          "Clue Unlocked",
                          style: customTextStyleAuth(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    vPad5,
                    Text(
                      "You've successfully unlocked\nthe 2nd clue in your treasure\nhunt adventure!",
                      style: customTextStyleAuth(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: textLightColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: CustomButton(buttonText: "View Next Clue", icon:Icons.arrow_forward, iconAtStart: false,
            
            // onPressed: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> LandingPage()),  (route) => false,),
            
            ),
          ),
          vPad20,
          Text("Keep exploring and solving clues to \ncomplete your treasure hunt!", style: customTextStyleAuth(
            fontSize: 12, 
            fontWeight: FontWeight.w400,
            color: textLightColor
          ),
          textAlign: TextAlign.center,
          ),
          vPad20,
        ],
      ),
    ),
    Positioned(
      top: 0, // Adjust to lift the image higher or lower
      left: 0,
      right: 0,
      child: Center(
        child: Image.asset("assets/toffe.png"),
      ),
    ),
       
  ],
),

           

        ],
      )),
    );
  }
}