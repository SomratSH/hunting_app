import 'package:flutter/material.dart';
import 'package:hunting_app/common/custom_button.dart';
import 'package:hunting_app/common/custom_padding.dart';
import 'package:hunting_app/common/text_style_custom.dart';
import 'package:hunting_app/constant/app_colors.dart';
import 'package:hunting_app/presentation/authentication/login_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
              vPad50,
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
                "Add your phone number. We’ll send a\nverification code to verify.",
                textAlign: TextAlign.center,
                style: customTextStyleAuth(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff97BECA),
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: PinCodeTextField(
                  textStyle: TextStyle(color: Colors.white),
                  appContext: context,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    inactiveFillColor: textFieldBgColor,
                    activeFillColor: textFieldBgColor,
                    selectedFillColor: textFieldBgColor,
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
                      color: Color(0xff2C739E), // Color for "Terms & Condition"
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              vPad20,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CustomButton(
                  buttonText: "Verify",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => LoginScreen()),
                    );
                  },
                  isWidth: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
