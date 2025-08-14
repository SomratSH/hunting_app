import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hunting_app/common/custom_padding.dart';
import 'package:hunting_app/common/text_style_custom.dart';
import 'package:hunting_app/constant/app_colors.dart';
import 'package:hunting_app/presentation/home_screen/home_provider.dart';
import 'package:hunting_app/presentation/notification/notification.dart';
import 'package:hunting_app/presentation/profile/profile.dart';
import 'package:hunting_app/presentation/profile/profile_provider.dart';
import 'package:provider/provider.dart';

import '../../constant/app_const.dart';
import '../hunts/hunts_details.dart';
import 'widget/custom _card.dart';
import 'widget/featured_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileProvider = context.watch<ProfileProvider>();
    final homeProvider = context.watch<HomeProvider>();
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
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => NotificationScreen(),
                            ),
                          );
                        },
                        child: Stack(
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
                      ),
                      SizedBox(width: 10),
                      // Profile icon with a circle background
                      profileProvider.isLoading
                          ? DecoratedBox(
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                    "assets/icon/profile.svg", // SVG asset path
                                    height:
                                        20, // You can adjust the size as needed
                                    width: 20,
                                  ),
                                ),
                              ),
                            )
                          : InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ProfilePage(),
                                ),
                              ),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:
                                        profileProvider
                                            .profileModel == null 
                                            
                                        ? SvgPicture.asset(
                                            "assets/icon/profile.svg", // SVG asset path
                                            height:
                                                20, // You can adjust the size as needed
                                            width: 20,
                                          )
                                        : ClipOval(
                                            child: Image.network(
                                              profileProvider
                                                  .profileModel
                                                  .data!
                                                  .image!,
                                              fit: BoxFit.cover,
                                              width: 40,
                                              height: 40,
                                            ),
                                          ),
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
            vPad20,

            // Search Box
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff97BECA),
                  borderRadius: BorderRadius.circular(6.0),
                  border: Border.all(color: Color(0xff97BECA)),
                ),
                child: TextField(
                  controller: homeProvider.searchController,
                  cursorColor: Colors.white,
                  style: customTextStyleAuth(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        "assets/icon/search.svg", // Search icon SVG
                        height: 15,
                        width: 15,
                      ),
                    ),
                    hintText: "Search Hunts, Cities etc...",
                    hintStyle: customTextStyleAuth(
                      fontSize: 12,
                      color: Color(0xff2765A1),
                      fontWeight: FontWeight.w400,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                  ),
                  onChanged: (value) {
                    homeProvider.searchHunts(
                      value,
                    ); // Trigger the search
                  },
                ),
              ),
            ),
            vPad20,

            // Show loading indicator if data is still loading
            homeProvider.isLoading
                ? Center(child: CircularProgressIndicator())
                : Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Featured Items (For example, based on label like 'featured', 'new', etc.)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: List.generate(
                                  homeProvider.huntsList.results!.length,
                                  (index) {
                                    if (homeProvider
                                                .huntsList
                                                .results![index]
                                                .label ==
                                            "featured" ||
                                        homeProvider
                                                .huntsList
                                                .results![index]
                                                .label ==
                                            "new" ||
                                        homeProvider
                                                .huntsList
                                                .results![index]
                                                .label ==
                                            "popular") {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                          onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=>   HuntsDetails(index: index),)),
                                          child: FeaturedItem(
                                            imagePath: homeProvider
                                                .huntsList
                                                .results![index]
                                                .image
                                                .toString(),
                                            categoryName: homeProvider
                                                .huntsList
                                                .results![index]
                                                .label
                                                .toString(),
                                            title: truncateText(
                                              homeProvider
                                                  .huntsList
                                                  .results![index]
                                                  .title
                                                  .toString(),
                                              15,
                                            ),
                                            subtitle: homeProvider
                                                .huntsList
                                                .results![index]
                                                .prizeAmount
                                                .toString(),
                                          ),
                                        ),
                                      );
                                    } else {
                                      return SizedBox();
                                    }
                                  },
                                ),
                              ),
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
                              image: NetworkImage( homeProvider.filteredHuntsList.results!.first.image.toString()),
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
                                        homeProvider.filteredHuntsList.results!.first.title.toString(),
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
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
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
                                // InkWell(
                                //   onTap: (){

                                //   },
                                //   child: Text(
                                //     "View all",
                                //     style: customTextStyleAuth(
                                //       fontSize: 14,
                                //       fontWeight: FontWeight.w500,
                                //       color: Color(0xff97BECA),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          // List of Hunts matching the search query
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Column(
                              children: List.generate(
                                homeProvider.filteredHuntsList.results!.length,
                                (index) {
                                  
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) =>
                                                  HuntsDetails(index: index),
                                            ),
                                          );
                                        },
                                        child: CustomCard(
                                          title: homeProvider
                                              .filteredHuntsList
                                              .results![index]
                                              .title
                                              .toString(),
                                          players: homeProvider
                                              .filteredHuntsList
                                              .results![index]
                                              .hunters
                                              .toString(),
                                          subtitle: homeProvider
                                              .filteredHuntsList
                                              .results![index]
                                              .description
                                              .toString(),
                                          location: homeProvider
                                              .filteredHuntsList
                                              .results![index]
                                              .city
                                              .toString(),
                                          name: "|",
                                          status: homeProvider
                                              .filteredHuntsList
                                              .results![index]
                                              .status
                                              .toString(),
                                          price: homeProvider
                                              .filteredHuntsList
                                              .results![index]
                                              .prizeAmount
                                              .toString(),
                                          timerText: homeProvider
                                              .filteredHuntsList
                                              .results![index]
                                              .duration
                                              .toString(),
                                          level: homeProvider
                                              .filteredHuntsList
                                              .results![index]
                                              .difficultyLevel
                                              .toString(),
                                          rating: homeProvider
                                              .filteredHuntsList
                                              .results![index]
                                              .ratings
                                              .toString(),
                                        ),
                                      ),
                                    );
                                 
                                },
                              ),
                            ),
                          ),
                          vPad70,
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
