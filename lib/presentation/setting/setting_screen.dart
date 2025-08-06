import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hunting_app/common/custom_padding.dart';
import 'package:hunting_app/common/text_style_custom.dart';
import 'package:hunting_app/constant/app_colors.dart';

import 'package:hunting_app/presentation/authentication/screen/login_screen.dart';
import 'package:hunting_app/presentation/profile/edit_profile.dart';
import 'package:hunting_app/presentation/profile/profile_provider.dart';
import 'package:provider/provider.dart';

import '../../common/custom_delete_dialog.dart';
import '../premium_subscription/get_premium_subscription.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileProvider = context.watch<ProfileProvider>();
    return Scaffold(
      backgroundColor: appBgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Settings Page",
              style: customTextStyleAuth(
                fontWeight: FontWeight.w700,
                fontSize: 34,
              ),
            ),
          ),
          vPad10,
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: card1,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: profileProvider.isLoading
                          ? Center(child: CircularProgressIndicator())
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          text2, // You can change this to any color you want for the background.
                                      child:
                                          profileProvider
                                                  .profileModel
                                                  .data!
                                                  .image !=
                                              null
                                          ? ClipOval(
                                              // Ensures that the image is cropped to a circular shape
                                              child: Image.network(
                                                profileProvider
                                                    .profileModel
                                                    .data!
                                                    .image
                                                    .toString(),
                                                fit: BoxFit
                                                    .cover, // This makes sure the image fills the CircleAvatar
                                                width: double
                                                    .infinity, // Ensures the image takes the full width of the CircleAvatar
                                                height: double
                                                    .infinity, // Ensures the image takes the full height of the CircleAvatar
                                              ),
                                            )
                                          : ClipOval(
                                              child: Image.asset(
                                                "assets/profile_place_holder.jpg",
                                                fit: BoxFit
                                                    .cover, // Same as above, fill the CircleAvatar
                                                width: double.infinity,
                                                height: double.infinity,
                                              ),
                                            ),
                                    ),

                                    hPad10,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          profileProvider
                                                  .profileModel
                                                  .data!
                                                  .name ??
                                              "N/A",
                                          style: customTextStyleAuth(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        Text(
                                          profileProvider
                                                  .profileModel
                                                  .data!
                                                  .email ??
                                              "N/A",
                                          style: customTextStyleAuth(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    // Handle edit action
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            EditProfileScreen(),
                                      ),
                                    );
                                  },
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                    size: 18,
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                  vPad50,

                  //price clam data portion
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: card1,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/icon/toffe_icon.svg"),
                              hPad10,
                              Text(
                                "Prize Claim",
                                style: customTextStyleAuth(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(color: textLightColor),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total prize claim",
                                    style: customTextStyleAuth(
                                      color: text2,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    "2",
                                    style: customTextStyleAuth(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              vPad5,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Last prize claimed",
                                    style: customTextStyleAuth(
                                      color: text2,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    "1 day ago",
                                    style: customTextStyleAuth(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: textLightColor,
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

                  vPad15,

                  //subscription portion
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: card1,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset("assets/icon/vip_icon.svg"),
                                  hPad10,
                                  Text(
                                    "Subscription",
                                    style: customTextStyleAuth(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),

                              InkWell(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => GetPremiumSubscription(),
                                  ),
                                ),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: blue2.withOpacity(0.4),
                                    border: Border.all(color: blue2),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                        vertical: 4,
                                      ),
                                      child: Text(
                                        "Get Premium",
                                        style: customTextStyleAuth(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(color: textLightColor),

                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Premium",
                                    style: customTextStyleAuth(
                                      color: text2,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    "Active till 01-01-2025",
                                    style: customTextStyleAuth(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: textLightColor,
                                    ),
                                  ),
                                ],
                              ),
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  color: blue2.withOpacity(0.4),
                                  border: Border.all(color: blue2),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                      vertical: 4,
                                    ),
                                    child: Text(
                                      "Active",
                                      style: customTextStyleAuth(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  vPad15,

                  //my hunts poriton
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: card1,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/icon/lcoation_red.svg"),
                              hPad10,
                              Text(
                                "My Hunts",
                                style: customTextStyleAuth(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(color: textLightColor),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Current hunt",
                                    style: customTextStyleAuth(
                                      color: text2,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    "Golden eagle quest",
                                    style: customTextStyleAuth(
                                      fontSize: 11,
                                      color: textLightColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              vPad5,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Location",
                                    style: customTextStyleAuth(
                                      color: text2,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        color: textLightColor,
                                        size: 12,
                                      ),
                                      hPad5,
                                      Text(
                                        "Cape town",
                                        style: customTextStyleAuth(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          color: textLightColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              vPad5,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Time left",
                                    style: customTextStyleAuth(
                                      color: text2,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.timer,
                                        color: Colors.red,
                                        size: 12,
                                      ),
                                      hPad5,
                                      Text(
                                        "2 h 34m",
                                        style: customTextStyleAuth(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  vPad15,

                  //account setting portion
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: card1,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/icon/setting_icon.svg"),
                              hPad10,
                              Text(
                                "Account",
                                style: customTextStyleAuth(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(color: textLightColor),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Logout",
                                    style: customTextStyleAuth(
                                      color: text2,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginScreen(),
                                        ),
                                        (route) => false,
                                      );
                                    },
                                    child: Icon(
                                      Icons.logout,
                                      color: text2,
                                      size: 18,
                                    ),
                                  ),
                                ],
                              ),
                              vPad15,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Delete Account",
                                    style: customTextStyleAuth(
                                      color: text2,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      showDeleteAccountDialog(context);
                                    },
                                    child: Icon(
                                      Icons.delete_outline,
                                      color: Colors.red,
                                      size: 18,
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

                  vPad70,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
