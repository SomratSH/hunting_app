import 'package:flutter/material.dart';
import 'package:hunting_app/common/custom_padding.dart';
import 'package:hunting_app/common/term_text_widget.dart';
import 'package:hunting_app/common/text_style_custom.dart';
import 'package:hunting_app/constant/app_colors.dart';
import 'package:hunting_app/constant/app_text.dart';
import 'package:hunting_app/presentation/term_condition/privacy_policy.dart';

class TermsCondition extends StatelessWidget {
  const TermsCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header with back icon and title
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back, color: textLightColor),
                ),
                Expanded(
                  child: Text(
                    "Terms & Condition",
                    textAlign: TextAlign.center,
                    style: customTextStyleAuth(
                      color: textLightColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),

            vPad20,

            // Scrollable DecoratedBox
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: card1,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TermsTextWidget(text: termHeadFirst),
                      TermsTextWidget(text: termValueFirst),
                      vPad10,
                      TermsTextWidget(text: termHeadSecond),
                      TermsTextWidget(text: termValueSecond),
                      vPad10,
                      TermsTextWidget(text: termHeadThird),
                      TermsTextWidget(text: termValueThird),
                      vPad10,
                      TermsTextWidget(text: termHeadFourth),
                      TermsTextWidget(text: termValueFourth),
                      vPad10,
                      TermsTextWidget(text: termHeadFifth),
                      TermsTextWidget(text: termValueFifth),
                      vPad10,
                      TermsTextWidget(text: termHeadSixth),
                      TermsTextWidget(text: termValueSixth),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=> PrivacyPolicy()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Next", style: customTextStyleWidget(),),
                    hPad10,
                    Icon(Icons.arrow_forward, color: textLightColor,),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
