import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hunting_app/common/custom_button.dart';
import 'package:hunting_app/common/custom_padding.dart';
import 'package:hunting_app/common/custom_snackBar.dart';
import 'package:hunting_app/common/text_style_custom.dart';
import 'package:hunting_app/constant/app_colors.dart';
import 'package:hunting_app/presentation/home_screen/home_provider.dart';
import 'package:hunting_app/presentation/hunts/price_clam_sucess.dart';
import 'package:hunting_app/presentation/landing_page/landing_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../common/custom_textfield_bg.dart';

class ClamPrice extends StatefulWidget {
  const ClamPrice({super.key});

  @override
  State<ClamPrice> createState() => _ClamPriceState();
}

class _ClamPriceState extends State<ClamPrice> {
  TextEditingController codeController = TextEditingController();
  
  bool isAccpet = false;
  @override
  Widget build(BuildContext context) {
    final proivder = context.watch<HomeProvider>();
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
              SingleChildScrollView(
                child: Column(
                  children: [
                    vPad15,
                    Image.asset("assets/splash_text_two.png"),
                    Divider(color: blue3),
                    vPad20,
                    Text(
                      "PRICE CLAM",
                      style: customTextStyleAuth(
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    vPad20,
                    Text(
                      "Upload your proof of purchase and claim\nyour prize",
                      style: customTextStyleAuth(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: textLightColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    vPad20,
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Proof of Purchase Photo *",
                          style: customTextStyleAuth(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: text2),
                        ),
                        child: proivder.imageFile != null ? Image.file(File(proivder.imageFile!.path), height: 200,width: double.infinity,fit: BoxFit.fill,) :
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: InkWell(
                              onTap: ()=> proivder.pickImage(),
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    "assets/icon/circum_camera.svg",
                                  ),
                                  Text(
                                    "Click to upload photo",
                                    style: customTextStyleAuth(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: textLightColor,
                                    ),
                                  ),
                                  vPad5,
                                  Text(
                                    "PNG, JPG upto 10 mb",
                                    style: customTextStyleAuth(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: text2,
                                    ),
                                  ),
                                  vPad5,
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Product Serial Number *",
                              style: customTextStyleAuth(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            vPad10,
                            CustomTextfieldBg(
                              controller: codeController,
                              hintText: "Enter Serial Number",
                              backgroundColor: Color(0xff767781),
                              borderRadius: 5,
                              hintTextColor: textLightColor.withOpacity(0.5),
                            ),
                            vPad10,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                hPad10,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Checkbox(
                                          activeColor: textLightColor,
                                          value: isAccpet,
                                          checkColor: Colors.white,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              isAccpet = value ?? false;
                                            });
                                          },
                                        ),
                                        Text(
                                          "I accept the terms and conditions *",
                                          style: customTextStyleAuth(
                                            color: textLightColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(left: 50),
                                      child: Flexible(
                                        child: Text(
                                          "By submitting, you agree to our prize claim policy and\nverification process.",
                                          overflow: TextOverflow.ellipsis,
                                          style: customTextStyleAuth(
                                            color: text2,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 11,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    vPad10,
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: () async{
                          // isAccpet == true
                          //     ? Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //           builder: (_) => PriceClamSucess(),
                          //         ),
                          //       )
                          //     : CustomSnackbar.show(
                          //         context,
                          //         message: "Accept Terms and Condition",
                          //         backgroundColor: blue1,
                          //       );
                          if (isAccpet == true) {
                            final response = await proivder.clamPriceApi(codeController.value.text);
                            if(response["message"] != null){
                              CustomSnackbar.show(
                              context,
                              message: response["message"],
                              backgroundColor: blue1,
                            );
                            Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => PriceClamSucess(),
                                  ),
                                );
                            }else if(response["error"] != null){
                                 CustomSnackbar.show(
                              context,
                              message: response["error"],
                              backgroundColor: Colors.red,
                            );
                            }
                           
                          }
                        },
                        child: proivder.isLoading ? Center(child: CircularProgressIndicator(),) : CustomButton(
                          buttonText: "Claim your prize",
                          color: blue3,
                        ),
                      ),
                    ),
                    vPad15,
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
