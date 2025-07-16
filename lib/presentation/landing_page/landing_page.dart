import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:hunting_app/common/custom_padding.dart';
import 'package:hunting_app/common/text_style_custom.dart';
import 'package:hunting_app/constant/app_colors.dart';
import 'package:hunting_app/presentation/home_screen/home_screen.dart';
import 'package:hunting_app/presentation/hunts/hunts_screen.dart';
import 'package:hunting_app/presentation/map/map_screen.dart';
import 'package:hunting_app/presentation/setting/setting_screen.dart';


class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _currentIndex = 0;

  // Define your icons and colors
  final List<Widget> _pages = [
    const HomeScreen(), // First page
    const HuntsScreen(), // Second page
    const MapScreen(), // Third page
    const SettingScreen(),
  ];


 final List<CustomNavBarItem> navItem = [
  CustomNavBarItem("assets/icon/home.svg", "Home"),
  CustomNavBarItem("assets/icon/hunts.svg", "Hunts"),
  CustomNavBarItem("assets/icon/map.svg", "Map"),
  CustomNavBarItem("assets/icon/setting.svg", "Settings"),
 ];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body:  SafeArea(child: Stack(
        children: [
          _pages[_currentIndex],
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
            height: 70,
            decoration: BoxDecoration(
              color: navBarBgColor,
               borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),

                    ),
            ),
            child: Row(
              children: List.generate(navItem.length,(index){
                return Expanded(child:_currentIndex == index ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                     
                      gradient: LinearGradient(colors: [
                        Color(0xff5D87A3),
                        Color(0xff123D74)
                      ])
                    ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(navItem[index].icon.toString()),
                            hPad15,
                            Text(navItem[index].title.toString(), style: customTextStyleAuth(
                              fontSize: 12,
                              fontWeight: FontWeight.w400
                            ),),
                          ],
                        ),
                      ),
                  ),
                ) :  InkWell(
                  onTap: (){
                    _currentIndex = index;
                    setState(() {
                      
                    });
                  },
                  child: SvgPicture.asset(navItem[index].icon.toString())) );
              }),
            ),
          ))
        ],
      ))
      
    
   
   
    );
  }
}


class CustomNavBarItem {
  String ?icon;
  String ?title;
  CustomNavBarItem(this.icon, this.title);
}

