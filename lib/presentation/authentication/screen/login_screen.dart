import 'package:flutter/material.dart';
import 'package:hunting_app/common/custom_padding.dart';
import 'package:hunting_app/common/custom_snackBar.dart';
import 'package:hunting_app/common/text_style_custom.dart';
import 'package:hunting_app/constant/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hunting_app/presentation/authentication/provider/authentication_provider.dart';
import 'package:hunting_app/presentation/authentication/screen/create_account_screen.dart';
import 'package:hunting_app/presentation/home_screen/home_screen.dart';
import 'package:hunting_app/presentation/landing_page/landing_page.dart';
import 'package:provider/provider.dart';

import '../../../common/custom_button.dart';
import '../../../common/custom_text_field.dart';
import 'reset_password.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
   final provider =context.watch<AuthenticationProvider>();
    return 
    
    Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              vPad20,
              Image.asset("assets/splash_text_two.png"),
              vPad20,
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  "Log In",
                  style: customTextStyleAuth(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Divider(),
              vPad20,

              Padding(
                padding: const EdgeInsets.symmetric(horizontal:  12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      controller: provider.emailController,
                      hintText: "Johndoe@example.com",
                      borderRadius: 10,
                      prefixIconSvgPath: 'assets/icon/message.svg',
                    ),
                    vPad20,
                    Text(
                      "Enter Password",
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
                      hintText: "Password",
                      borderRadius: 10,
                      prefixIconSvgPath: 'assets/icon/password.svg',
                    ),
                    vPad20,
                    // Forgot Password text with right alignment
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: ()async{
                          
                            Navigator.push(context, MaterialPageRoute(builder: (_)=> ResetPassword()));
                          },
                          child: Text(
                            "Forgot Password?",
                            style: customTextStyleAuth(
                              color: Color(0xff97BECA),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    vPad10,
                   provider.isLoading ? Center(child: CircularProgressIndicator()) : CustomButton(buttonText: "Login", onPressed: () async {

                        final status = await provider.login();
                            if(status["error"] != null){
                              CustomSnackbar.show(context, message: "Email or Password is incorrect", backgroundColor: Colors.red);
                             
                            }else if(status["message"] != null){
                              CustomSnackbar.show(context, message: status["message"]);
                               Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => LandingPage()),
                              );
                            }
                      // Navigator.push(context, MaterialPageRoute(builder: (_) => LandingPage()));
                    }),
                    vPad10,
                    // Center(
                    //   child: Text(
                    //     "Or",
                    //     style: customTextStyleAuth(
                    //       fontSize: 12,
                    //       color: Color(0xff97BECA),
                    //       fontWeight: FontWeight.w400,
                    //     ),
                    //   ),
                    // ),
                    // vPad10,
                    // // Row with container and SVG icons
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Container(
                    //       decoration: BoxDecoration(
                    //         border: Border.all(color: Color(0xff97BECA)),
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //       child: GestureDetector(
                    //         onTap: () {},
                    //         child: Padding(
                    //           padding: const EdgeInsets.all(8.0),
                    //           child: SvgPicture.asset(
                    //             'assets/icon/google.svg',
                    //             width: 24,
                    //             height: 24,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //     hPad15,
                    //     Container(
                    //       decoration: BoxDecoration(
                    //         border: Border.all(color: Color(0xff97BECA)),
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //       child: GestureDetector(
                    //         onTap: () {},
                    //         child: Padding(
                    //           padding: const EdgeInsets.all(8.0),
                    //           child: SvgPicture.asset(
                    //             'assets/icon/apple.svg',
                    //             width: 24,
                    //             height: 24,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
          
                    // vPad20,
          
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: customTextStyleAuth(
                            fontSize: 14,
                            color: Color(0xff97BECA),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        InkWell(
                          onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (_) => CreateAccountScreen())),
                          child: Text(
                            "Sign Up",
                            style: customTextStyleAuth(
                              fontSize: 14,
                              color: Color(0xff2765A1),
                               fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
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
