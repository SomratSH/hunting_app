import 'package:flutter/material.dart';
import 'package:hunting_app/presentation/home_screen/home_provider.dart';
import 'package:provider/provider.dart';

import '../../common/custom_padding.dart';
import '../../common/text_style_custom.dart';
import '../../constant/app_colors.dart';
import '../../constant/app_const.dart';
import '../home_screen/widget/custom _card.dart';
import 'hunts_details.dart';

class HuntsScreen extends StatelessWidget {
  const HuntsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeProvider>();
    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
        child: Column(
          children: [
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
                  // Text(
                  //   "View all",
                  //   style: customTextStyleAuth(
                  //     fontSize: 14,
                  //     fontWeight: FontWeight.w500,
                  //     color: Color(0xff97BECA),
                  //   ),
                  // ),
                ],
              ),
            ),
            homeProvider.isLoading ? Center(
              child: CircularProgressIndicator(),
            ) :   homeProvider.huntsList.isEmpty ? Center(
              child: Text("No hunts available"),
            ) : Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(homeProvider.huntsList.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=> HuntsDetails(
                            index: index,
                          )));
                        },
                        child: CustomCard(

                          title: homeProvider.huntsList[index].title.toString(),
                          players: "3",
                          subtitle: homeProvider.huntsList[index].description.toString(),
                          // location: homeProvider.huntsList[index].location,
                          location: homeProvider.huntsList[index].city.toString(),
                          name: "|",
                          status: homeProvider.huntsList[index].status.toString(),
                          price: homeProvider.huntsList[index].prizeAmount.toString(),
                          timerText: homeProvider.huntsList[index].duration.toString(),
                          level: homeProvider.huntsList[index].difficultyLevel.toString(),
                          rating: "",
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            vPad70,
          ],
        ),
      ),
    );
  }
}
