import 'package:flutter/material.dart';
import 'package:hunting_app/presentation/splash_screen/splash_screen.dart';
import 'package:hunting_app/provider_list.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: ProviderList.providers,
    child:  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  SplashScreen()
    ),
    );


  }
}

