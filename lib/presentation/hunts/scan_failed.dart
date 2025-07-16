import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hunting_app/common/custom_button.dart';
import 'package:hunting_app/common/custom_padding.dart';
import 'package:hunting_app/common/text_style_custom.dart';
import 'package:hunting_app/constant/app_colors.dart';

class ScanFailed extends StatelessWidget {
  const ScanFailed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(child: Column(
        children: [ 
          vPad10,
          Image.asset("assets/splash_text_two.png"),
          Divider(color: blueShade3,),
          vPad20,
          Text("OOPS!", style: customTextStyleAuth(
            fontWeight: FontWeight.w700,
            fontSize: 28,
          ),),
          vPad50,
          DecoratedBox(decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset("assets/icon/info.svg"),
          ),
          
          ),
          vPad20,
          Text("Wrong Location", style: customTextStyleAuth(
            fontSize: 20,
            fontWeight: FontWeight.w600
          ),),
          vPad10,
          Text("This place is not correct. Please \ntry a different location.", style: customTextStyleAuth(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: textLightColor
          ),
          textAlign: TextAlign.center,
          ),

          vPad50,
          DecoratedBox(decoration: BoxDecoration(
            color: Color(0xffE336293B),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.red)

          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/icon/info_two.svg"),
                hPad10,
                Text("Hint: Re-read the clue carefully and\nlook for landmarks mentioned.", 
                style: customTextStyleAuth(
                  color: Color(0xffFFAEA8),
                  fontSize: 14,
                  fontWeight: FontWeight.w400
                ),
                textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          ),
          vPad20,
          Row(
            children: [
              Expanded(child: CustomButton(buttonText: "Back to clue", icon: Icons.arrow_back,color: blue2,)),
              hPad10,
              Expanded(child: CustomButton(buttonText: "Back to clue", icon: Icons.redo,color: Colors.white,  textColor: blue2,)),
            ],
          )

        ],
      )),
    );
  }
}