import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hunting_app/common/custom_padding.dart';
import 'package:hunting_app/common/text_style_custom.dart';
import 'package:hunting_app/constant/app_colors.dart';

import '../../constant/app_const.dart';
import '../hunts/hunts_details.dart';
import 'widget/custom _card.dart';
import 'widget/featured_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header Row with Logo, Notification, and Profile
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  // Logo Image
                  Image.asset("assets/home_bar.png", height: 50, width: 100),
                  Spacer(),
                  // Row for notification and profile icons
                  Row(
                    children: [
                      // Notification icon with badge
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          SvgPicture.asset(
                            "assets/icon/notification.svg", // SVG asset path
                            height: 30,
                            width: 30,
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red, // Red color for the badge
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      // Profile icon with a circle background
                      DecoratedBox(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color.fromARGB(255, 129, 129, 129),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              "assets/icon/profile.svg", // SVG asset path
                              height: 20, // You can adjust the size as needed
                              width: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(color: Color(0xff264A5F)),
            // Vertical Padding after Divider
            vPad20,
            // Search Box
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(
                    0xff97BECA,
                  ), // Light gray background for the search box
                  borderRadius: BorderRadius.circular(6.0),
                  border: Border.all(color: Color(0xff97BECA)),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        "assets/icon/search.svg", // Search icon SVG
                        height: 15, // You can adjust the size as needed
                        width: 15,
                      ),
                    ),
                    hintText: "Search Hunts, Cities etc...",
                    hintStyle: customTextStyleAuth(
                      fontSize: 12,
                      color: Color(0xff2765A1),
                      fontWeight: FontWeight.w400,
                    ), // Hint text inside the search box
                    border: InputBorder.none, // Removes the default border
                    contentPadding: EdgeInsets.all(
                      10,
                    ), // Padding inside the search box
                  ),
                ),
              ),
            ),
            vPad20,
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: FeaturedItem(
                          imagePath: "assets/featured_image_one.png",
                          categoryName: "Featured",
                          title: "Mega Prize Hunt",
                          subtitle: "450",
                        ),
                      ),
                      hPad10,
                      Expanded(
                        child: FeaturedItem(
                          imagePath: "assets/featured_image_two.png",
                          categoryName: "New",
                          title: "Weekend Special",
                          subtitle: "500",
                          categoryColor: Color(0xffC89800),
                        ),
                      ),
                    ],
                  ),
                ),
                vPad10,
                
                 Padding(
                   padding: const EdgeInsets.symmetric( horizontal: 8.0),
                   child: Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            image: DecorationImage(
                              image: AssetImage("assets/featured_image_three.png"),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          child:
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    // mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Continue Hunting",
                                        style: customTextStyleAuth(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        "Treasure Trail Africa",
                                        style: customTextStyleAuth(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                            
                              Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xff2765A1),
                                  borderRadius: BorderRadius.circular(22),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                                child: Text(
                                  "Resume",
                                  style: customTextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            
                              ],
                            ),
                          ),
                         
                        ),
                 ),
               
                vPad10,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "ALL HUNTS",
                        style: customTextStyleAuth(
                          color: Color(0xff97BECA),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "View all",
                        style: customTextStyleAuth(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff97BECA),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: List.generate(data.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                           Navigator.push(context, MaterialPageRoute(builder: (_)=> HuntsDetails(
                          index: index,
                        )));
                        },
                        child: CustomCard(
                          
                          title: data[index].title,
                          players: data[index].players,
                          subtitle: data[index].subtitle,
                          location: data[index].location,
                          name: data[index].name,
                          status: data[index].status,
                          price: data[index].price,
                          timerText: data[index].timerText,
                          level: data[index].level,
                          rating: data[index].rating,
                        ),
                      ),
                    );
                  }),
                ),
                vPad70,
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
