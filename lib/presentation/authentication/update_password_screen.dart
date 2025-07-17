import 'package:flutter/material.dart';
import 'package:hunting_app/common/custom_padding.dart';
import 'package:hunting_app/constant/app_colors.dart';
import 'package:hunting_app/presentation/authentication/login_screen.dart';

import '../../common/custom_button_without_width.dart';
import '../../common/custom_text_field.dart';
import '../../common/text_style_custom.dart';
import 'otp_verification_screen.dart';

class UpdatePasswordScreen extends StatelessWidget {
  const UpdatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
        child:
        Padding(
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
                      "Create New Password",
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
              Container(
                height: 100,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/splash_text_two.png"))
                ),
                ),
              vPad20,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create your new password to access your manual",
                    style: customTextStyleAuth(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff767781),
                    ),
                  ),
                  vPad20,
                  Text(
                    "Create Password",
                    style: customTextStyleAuth(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff97BECA),
                    ),
                  ),
                  vPad15,
                  CustomTextField(
                    isPassword: true,
                    controller: TextEditingController(),
                    hintText: "ex: gfe9345@#chDF",
                    borderRadius: 10,
                    prefixIconSvgPath: 'assets/icon/password.svg',
                  ),
                  vPad20,
                  Text(
                    "Confirm New Password",
                    style: customTextStyleAuth(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff97BECA),
                    ),
                  ),
                  vPad15,
                  CustomTextField(
                    isPassword: true,
                    controller: TextEditingController(),
                    hintText: "ex: gfe9345@#chDF",
                    borderRadius: 10,
                    prefixIconSvgPath: 'assets/icon/password.svg',
                  ),
                ],
              ),
              vPad50,
              CustomButtonWithoutWidth(
                buttonText: "Confirm",

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => LoginScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
