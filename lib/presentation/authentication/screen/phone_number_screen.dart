import 'package:flutter/material.dart';
import 'package:hunting_app/common/custom_button.dart';
import 'package:hunting_app/common/custom_padding.dart';
import 'package:hunting_app/common/text_style_custom.dart';
import 'package:hunting_app/constant/app_colors.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'otp_screen.dart';

class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    PhoneNumber number = PhoneNumber(isoCode: 'ZA');

    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
        child: SingleChildScrollView(  // Ensure the whole screen can scroll
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              
              
                          // Minimizes the height of the column
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back, color: Colors.white,)),
                ),
                vPad20,
                Text(
                  "Verify your\nPhone Number",
                  textAlign: TextAlign.center,
                  style: customTextStyleAuth(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                vPad20,
                Text(
                  "Add your phone number. We’ll send a\verification code to verify.",
                  textAlign: TextAlign.center,
                  style: customTextStyleAuth(
                    color: Color(0xff97BECA),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                vPad20,
            
                // Phone number input with country code
                Container(
                  decoration: BoxDecoration(
                    color: text2.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: InternationalPhoneNumberInput(
                        cursorColor: textLightColor,
                        textStyle: customTextStyleAuth(
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontSize: 14
                        ),
                      onInputChanged: (PhoneNumber number) {
                        // The input is updated, but we're not managing it in this stateless widget
                      },
                      initialValue: number,
                      selectorConfig: SelectorConfig(
                        selectorType: PhoneInputSelectorType.DIALOG,
                        showFlags: true,
                      ),
                      textFieldController: phoneController,
                      formatInput: false,
                      inputDecoration: InputDecoration(
                        
          
                        hintStyle: TextStyle(color: text2),
                        fillColor: Colors.transparent,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 20,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: text2),
                        ),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                vPad20,
            
                // Send OTP button
                CustomButton(
                  buttonText: "Send OTP",
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (_) => OtpScreen()),
                    // );
                  },
                ),
                vPad15,
            
                // Terms and Conditions Text
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text.rich(
                    
                    TextSpan(
                      children: [
                        TextSpan(
                          text: " By Signing up You’re agree with our ",
                          style: customTextStyleAuth(
                            fontSize: 14,
                            color: Color(0xff97BECA),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: "Terms & Condition ",
                          style: customTextStyleAuth(
                            fontSize: 14,
                            color: Color(0xff2C739E),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: "and ",
                          style: customTextStyleAuth(
                            fontSize: 14,
                            color: Color(0xff97BECA),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: "Privacy policy.",
                          style: customTextStyleAuth(
                            fontSize: 14,
                            color: Color(0xff2C739E),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    
                    textAlign: TextAlign.center,
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
