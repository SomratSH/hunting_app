import 'package:flutter/material.dart';
import 'package:hunting_app/common/custom_padding.dart';
import 'package:hunting_app/constant/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../common/custom_button.dart';
import '../../common/text_style_custom.dart';
import 'update_password_screen.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                      child: Text(
                        "OTP Verification",
                        textAlign:
                            TextAlign.center, // Center the text within the row
                        style: customTextStyleAuth(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(),
                vPad50,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: PinCodeTextField(
                    textStyle: TextStyle(color: Colors.white),
                    appContext: context,
                    length: 4,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                      fieldHeight: 50,
                      fieldWidth: 50,
                      inactiveColor: text2,
                      activeColor: textLightColor,
                      selectedColor: textLightColor,
                    ),
                    onChanged: (value) {
                      // Handle OTP field changes
                      print(value);
                    },
                    onCompleted: (value) {
                      // Handle OTP completion (e.g., submit OTP)
                      print("OTP Completed: $value");
                    },
                  ),
                ),
                vPad20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn’t get OTP? ",
                      style: customTextStyleAuth(
                        fontSize: 13,
                        color: Color(0xff97BECA), // Color for "I agree to the"
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Resend",
                      style: customTextStyleAuth(
                        fontSize: 13,
                        color: Color(
                          0xff2C739E,
                        ), // Color for "Terms & Condition"
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                vPad50,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: CustomButton(
                    buttonText: "Verify",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => UpdatePasswordScreen(),
                        ),
                      );
                    },
                    isWidth: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
