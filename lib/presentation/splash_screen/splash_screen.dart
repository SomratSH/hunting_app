import 'package:flutter/material.dart';
import 'package:hunting_app/constant/app_colors.dart';
import 'package:hunting_app/presentation/landing_page/landing_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../authentication/screen/login_screen.dart';
import 'splash _screen_second.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {

      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => SplashScreenSecond()),
      );
    });
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashColor,
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff3B6074), Color(0xff0B2438), Color(0xff041119)],
            begin: Alignment.topCenter, // Start from the top
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 200,
              child: SizedBox(
                height: 350,

                child: Opacity(
                  opacity: 0.2,
                  child: Image.asset(
                    "assets/splash_bg.png",
                    fit: BoxFit
                        .fitHeight, // Makes sure the image covers the screen
                    // Makes sure the image fills the entire screen width
                  ),
                ),
              ),
            ),

            // Centered Column with images
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize
                    .min, // Ensures the column takes only as much space as needed
                children: [
                  Image.asset("assets/splash_text.png", height: 100),
                  SizedBox(height: 10),
                  Image.asset("assets/loading.png", height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
