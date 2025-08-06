import 'package:flutter/material.dart';
import 'package:hunting_app/common/custom_padding.dart';
import 'package:hunting_app/common/custom_snackBar.dart';
import 'package:hunting_app/constant/app_colors.dart';
import 'package:hunting_app/presentation/authentication/provider/authentication_provider.dart';
import 'package:hunting_app/presentation/authentication/screen/login_screen.dart';
import 'package:provider/provider.dart';

import '../../../common/custom_button_without_width.dart';
import '../../../common/custom_text_field.dart';
import '../../../common/text_style_custom.dart';
import 'otp_verification_screen.dart';

class UpdatePasswordScreen extends StatelessWidget {
  const UpdatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AuthenticationProvider>();
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
                    controller: provider.passwordController,
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
                    controller: provider.retypePasswordController,
                    hintText: "ex: gfe9345@#chDF",
                    borderRadius: 10,
                    prefixIconSvgPath: 'assets/icon/password.svg',
                  ),
                ],
              ),
              vPad50,
             provider.isLoading ? Center(
               child: CircularProgressIndicator(
                
               ),
             ) : CustomButtonWithoutWidth(
                buttonText: "Confirm",

                onPressed: () async{

                  if (provider.passwordController.text.isEmpty ||
                      provider.retypePasswordController.text.isEmpty) {
                    CustomSnackbar.show(context, message: "Please fill all fields", backgroundColor: Colors.red);
                    return;
                  }else if (provider.passwordController.text != provider.retypePasswordController.text) {
                    CustomSnackbar.show(context, message: "Passwords do not match", backgroundColor: Colors.red);
                    return;
                  }
                  final response = await provider.resetPassword();
                  if (response["message"] != null) {
                    CustomSnackbar.show(context, message: response["message"], backgroundColor: Colors.green);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => LoginScreen()),
                    );
                  } else {
                    CustomSnackbar.show(context, message: response["detail"], backgroundColor: Colors.red);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
