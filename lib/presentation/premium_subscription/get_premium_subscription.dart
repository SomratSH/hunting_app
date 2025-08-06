import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hunting_app/common/custom_button.dart';
import 'package:hunting_app/common/custom_padding.dart';
import 'package:hunting_app/common/text_style_custom.dart';
import 'package:hunting_app/constant/app_colors.dart';
import 'package:hunting_app/presentation/premium_subscription/subscription_stripe.dart';
import 'package:hunting_app/presentation/setting/setting_provider.dart';
import 'package:hunting_app/presentation/term_condition/privacy_policy.dart';
import 'package:hunting_app/presentation/term_condition/terms_condition.dart';
import 'package:provider/provider.dart';

class GetPremiumSubscription extends StatelessWidget {
  const GetPremiumSubscription({super.key});

  @override
  Widget build(BuildContext context) {
    final settingProvider = context.watch<SettingProvider>();
    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
          children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(Icons.cancel_outlined, color: Colors.white,)),
              ),
              vPad10,

            Padding(padding: EdgeInsets.all(8),
            child:
            Column(
              children: [
                Text("You have selected a pro feature", style: customTextStyleAuth(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),),
                vPad15,
                Text("Unlock all the clues and Access to big\nmonthly prize hunts.", style: customTextStyleAuth(
                    color: text2,
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                ),
                  textAlign: TextAlign.center,
                ),

                vPad15,
                ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(10),
                    child: Image.asset("assets/active_hunt_image.jpg")),
                vPad10,
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      Text("CHASE THE CASH", style: GoogleFonts.paytoneOne(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w400
                      ),),
                      hPad10,
                      DecoratedBox(decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3)
                      ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric( horizontal: 6.0),
                          child: Text("Pro", style: GoogleFonts.rasa(fontWeight: FontWeight.w700,fontSize: 13),),
                        ),
                      )
                    ],
                  ),
                ),
                vPad15,

                //basic portion
                // DecoratedBox(decoration: BoxDecoration(
                //   color: blue1,
                //   borderRadius: BorderRadius.circular(16),
                // ),
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             Padding(
                //               padding: const EdgeInsets.only(left: 4),
                //               child: Text("Basic", style: customTextStyleAuth(
                //                   fontSize: 18,
                //                   fontWeight: FontWeight.w600
                //               ),

                //               ),
                //             ),
                //             DecoratedBox(decoration: BoxDecoration(
                //               color: green,
                //               borderRadius: BorderRadius.circular(  20),

                //             ),
                //               child: Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Text("R29.99/month", style: customTextStyleAuth(
                //                     fontSize: 10,
                //                     fontWeight: FontWeight.w500
                //                 ),),
                //               ),
                //             )
                //           ],
                //         ),
                //         Text(" Access to all standard hunts", style: customTextStyleAuth(
                //             fontSize: 14,
                //             fontWeight: FontWeight.w400
                //         ),)
                //       ],
                //     ),
                //   ),
                // ),
                // vPad15,
                //premium

                Column(
                  children: List.generate(settingProvider.planList.length, (index) => 
                
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> StripePaymentWebView(url: settingProvider.planList[index].stripePriceId.toString(),)));
                    },
                    child: DecoratedBox(decoration: BoxDecoration(
                        color: card1,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.white)
                    ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Text(settingProvider.planList[index].name.toString(), style: customTextStyleAuth(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600
                                  ),
                    
                                  ),
                                ),
                                DecoratedBox(decoration: BoxDecoration(
                                  color: textLightColor ,
                                  borderRadius: BorderRadius.circular(  20),
                    
                                ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("${settingProvider.planList[index].currency}${settingProvider.planList[index].price.toString()}/${settingProvider.planList[index].interval}", style: customTextStyleAuth(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black
                                    ),),
                                  ),
                                )
                              ],
                            ),
                            vPad15,
                            Padding(
                              padding: const EdgeInsets.only(left: 6.0),
                              child: Text(settingProvider.planList[index].description.toString(), style: customTextStyleAuth(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                              ),),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
               ),
                ),
                
               
                vPad50,


                CustomButton(buttonText: "Start 1 free hunt", color: secondaryColor, textColor: primaryColor,),
                vPad20,
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "By placing this order, you agree to the",
                        style: customTextStyleAuth(
                          fontSize: 14,
                          color: Colors.white,// Color for "I agree to the"
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: "Terms & Condition ",
                        recognizer: TapGestureRecognizer()..onTap = (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=> TermsCondition()));
                        },
                        style: customTextStyleAuth(
                          fontSize: 14,
                          color: Color(
                            0xffFFD400,
                          ), // Color for "Terms & Condition"
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: "and ",
                        style: customTextStyleAuth(
                          fontSize: 14,
                          color: Colors.white, // Color for "and"
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: "Privacy policy.",
                        recognizer: TapGestureRecognizer()..onTap = (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=> PrivacyPolicy()));
                        },
                        style: customTextStyleAuth(
                          fontSize: 14,
                          color: Color(
                            0xffFFD400,
                          ), // Color for "Privacy policy"
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: " Subscription automatically renews unless auto-renew is turned off at least 24-hours before the current period.",
                        style: customTextStyleAuth(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),


                    ],
                  ),

                  textAlign: TextAlign.start,
                ),

              ],
            )
              ,
            )
          ],
                ),
        )),
    );
  }
}