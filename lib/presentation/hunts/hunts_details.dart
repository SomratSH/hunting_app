import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hunting_app/common/custom_button.dart';
import 'package:hunting_app/common/custom_padding.dart';
import 'package:hunting_app/common/custom_snackBar.dart';
import 'package:hunting_app/common/enum.dart';
import 'package:hunting_app/common/text_style_custom.dart';
import 'package:hunting_app/constant/app_colors.dart';
import 'package:hunting_app/constant/app_const.dart';
import 'package:hunting_app/constant/app_urls.dart';
import 'package:hunting_app/presentation/home_screen/home_provider.dart';
import 'package:hunting_app/presentation/hunts/all_clues_screen.dart';
import 'package:hunting_app/presentation/hunts/clues_screen.dart';
import 'package:provider/provider.dart';

import 'widget/custom_duration_card.dart';

class HuntsDetails extends StatelessWidget {
  int? index;

  HuntsDetails({super.key, this.index});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    final List<String> rules = provider.huntsList.results![index!].rules!.split(
      "\r",
    );
    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
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
                    "Hunt Details",
                    style: customTextStyleAuth(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Divider(color: Color(0xff264A5F)),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              provider.huntsList.results![index!].image != null
                              ? NetworkImage(
                                  provider.huntsList.results![index!].image
                                      .toString(),
                                )
                              : AssetImage("assets/hunt_details.png"),
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    vPad10,
                    Text(
                      provider.huntsList.results![index!].title.toString(),
                      textAlign: TextAlign.center,
                      style: customTextStyleAuth(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Color(0xff97BECA),
                      ),
                    ),
                    vPad10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.group_outlined, color: Colors.white),
                        hPad5,
                        Text(
                          "${provider.huntsList.results![index!].hunters} hunters",
                          style: customTextStyleAuth(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                        hPad10,
                        Icon(Icons.star, color: Color(0xffC89800)),
                        hPad5,
                        Text(
                          provider.huntsList.results![index!].ratings
                              .toString(),
                          style: customTextStyleAuth(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    vPad20,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomDurationCard(
                              iconPath:
                                  "assets/icon/time.svg", // Custom icon path
                              duration: provider
                                  .huntsList
                                  .results![index!]
                                  .duration
                                  .toString(), // Custom duration value
                              title: "Duration", // Custom title
                            ),
                          ),
                          hPad15,
                          Expanded(
                            child: CustomDurationCard(
                              iconPath:
                                  "assets/icon/clue.svg", // Custom icon path
                              duration:
                                  "${provider.huntsList.results![index!].clues!.length.toString()} clues", // Custom duration value
                              title: "Clues", // Custom title
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomDurationCard(
                        iconPath: "assets/icon/award.svg", // Custom icon path
                        duration:
                            "${data[index!].price.toString()}", // Custom duration value
                        title: "Cash Price", // Custom title
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xff111827),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Description",
                                style: customTextStyleAuth(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              vPad10,
                              Text(
                                provider.huntsList.results![index!].description
                                    .toString(),

                                style: customTextStyleAuth(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff97BECA),
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    vPad10,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color(0xff111827),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 16.0,
                                top: 10,
                              ),
                              child: Text(
                                "Rules & Guidelines",
                                style: customTextStyleAuth(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            vPad5,
                            Column(
                              children: List.generate(rules.length, (index) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.start,

                                  children: [
                                    Checkbox(
                                      value:
                                          false, // Set initial value here, or bind to data
                                      onChanged: (bool? value) {
                                        // Handle checkbox state change
                                      },
                                    ),
                                    Expanded(
                                      child: Text(
                                        rules[index],
                                        style: customTextStyleAuth(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff97BECA),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage("assets/clues_bg.png"),
                            fit: BoxFit
                                .cover, // Use cover to maintain the aspect ratio
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(
                            16.0,
                          ), // Added padding inside the container
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              // Main content with the clue text
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    vPad50,
                                    // Title
                                    Text(
                                      "First Clue Preview",
                                      style: customTextStyleAuth(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors
                                            .black, // Use black for better contrast
                                      ),
                                    ),
                                    vPad5, // Space between title and clue text
                                    // Clue Text
                                    SingleChildScrollView(
                                      child: Text(
                                        "\"${provider.huntsList.results![index!].clues!.isEmpty ? "N/A"  : "${provider.huntsList.results![index!].clues!.first.hint}"}\"",
                                        textAlign: TextAlign.start,
                                        style: customTextStyleAuth(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors
                                              .black, // Black color for better readability
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Button to "View Clues"
                              InkWell(
                                onTap: () {
                                    if(provider.huntsList.results![index!].clues!.isEmpty ){
                                      CustomSnackbar.show(context, message: "No Clues Available", backgroundColor: Colors.red);
                                    }else{
                                           Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          AllCluesScreen(index: index),
                                    ),
                                  );
                                    }
                               
                                },
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: blue1,
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "View Clues",
                                        style: customTextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    vPad5,
                    // ignore: unrelated_type_equality_checks
                    data[index!].status == ClueStatus.completed
                        ? SizedBox()
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomButton(
                              onPressed: () {
                               if(provider.huntsList.results![index!].clues!.isEmpty ){
                                      CustomSnackbar.show(context, message: "No Clues Available", backgroundColor: Colors.red);
                                    }else{
                                           Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          AllCluesScreen(index: index),
                                    ),
                                  );
                                    }
                              },
                              buttonText: "Start Hunt",
                              borderRadius: 10,
                              icon: Icons.play_arrow_outlined,
                            ),
                          ),
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
