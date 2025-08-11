import 'package:flutter/material.dart';
import 'package:hunting_app/common/custom_padding.dart';
import 'package:hunting_app/common/term_text_widget.dart';
import 'package:hunting_app/common/text_style_custom.dart';
import 'package:hunting_app/constant/app_colors.dart';
import 'package:hunting_app/constant/app_text.dart';
import 'package:hunting_app/presentation/landing_page/landing_page.dart';
import 'package:hunting_app/presentation/setting/setting_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_html/flutter_html.dart';
class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SettingProvider>();
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
                    "Privacy & Policy",
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
                  child:  Html(
                    style: {
            "*": Style(
              color: Colors.white,  // Apply white color to all text
            ),
          },
          data: provider.policy,
        ),
                  
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     TermsTextWidget(text: termHeadFirst),
                  //     TermsTextWidget(text: termValueFirst),
                  //     vPad10,
                  //     TermsTextWidget(text: termHeadSecond),
                  //     TermsTextWidget(text: termValueSecond),
                  //     vPad10,
                  //     TermsTextWidget(text: termHeadThird),
                  //     TermsTextWidget(text: termValueThird),
                  //     vPad10,
                  //     TermsTextWidget(text: termHeadFourth),
                  //     TermsTextWidget(text: termValueFourth),
                  //     vPad10,
                  //     TermsTextWidget(text: termHeadFifth),
                  //     TermsTextWidget(text: termValueFifth),
                  //     vPad10,
                  //     TermsTextWidget(text: termHeadSixth),
                  //     TermsTextWidget(text: termValueSixth),
                  //   ],
                  // ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (_)=> LandingPage()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Confirm", style: customTextStyleWidget(),),
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
