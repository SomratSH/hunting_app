import 'package:flutter/material.dart';
import 'package:hunting_app/common/custom_padding.dart';
import 'package:hunting_app/common/custom_snackBar.dart';
import 'package:hunting_app/common/text_style_custom.dart';
import 'package:hunting_app/constant/app_colors.dart';
import 'package:hunting_app/presentation/authentication/provider/authentication_provider.dart';
import 'package:hunting_app/presentation/authentication/screen/otp_verification_screen.dart';
import 'package:provider/provider.dart';

import '../../../common/custom_button.dart';
import '../../../common/custom_button_without_width.dart';
import '../../../common/custom_text_field.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AuthenticationProvider>();
    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
        child: Padding(padding: EdgeInsets.all(8),
        child:
        Column(
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
                    "Forgot Password",
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Reset Your Passowrd",
                  style: customTextStyleAuth(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                vPad15,
                Text(
                  "Please enter your email to get OTP for the next step to\nreset your password",
                  style: customTextStyleAuth(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff767781),
                  ),
                ),
                vPad20,
                Text(
                  "Enter your Email",
                  style: customTextStyleAuth(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff97BECA),
                  ),
                ),
                vPad15,

                CustomTextField(
                  controller:   provider.emailController,
                  hintText: "Johndoe@example.com",
                  borderRadius: 10,
                  prefixIconSvgPath: 'assets/icon/message.svg',
                ),
                vPad50,
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: " By Singing up You’re agree with our ",
                        style: customTextStyleAuth(
                          fontSize: 14,
                          color: Color(
                            0xff97BECA,
                          ), // Color for "I agree to the"
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: "Terms & Condition\n",
                        style: customTextStyleAuth(
                          fontSize: 14,
                          color: Color(
                            0xff2C739E,
                          ), // Color for "Terms & Condition"
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: "and ",
                        style: customTextStyleAuth(
                          fontSize: 14,
                          color: Color(0xff97BECA), // Color for "and"
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: "Privacy policy.",
                        style: customTextStyleAuth(
                          fontSize: 14,
                          color: Color(
                            0xff2C739E,
                          ), // Color for "Privacy policy"
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),

                  textAlign: TextAlign.start,
                ),
              ],
            ),
            vPad50,
          provider.isLoading ? Center(
            child: CircularProgressIndicator(),
          ) : CustomButtonWithoutWidth(
              buttonText: "Send OTP",

              onPressed: () async {

                if (provider.emailController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please enter your email")),
                  );
                 
                }else{
                  final status = await provider.sendOtp();
                  if (status["detail"] != null) {
                  CustomSnackbar.show(context, message: status["detail"], backgroundColor: Colors.red);
                  } else if (status["message"] != null) {
                    CustomSnackbar.show(context, message: status["message"], backgroundColor: Colors.green);
                     Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => OtpVerificationScreen(
                    email: provider.emailController.text,
                  )),
                );
                  }
                }
               
              },
            ),
          ],
        ),

        )


      ),
    );
  }
}
