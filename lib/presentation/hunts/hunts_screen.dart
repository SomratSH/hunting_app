import 'package:flutter/material.dart';

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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
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
              ),
            ),
            vPad70,
          ],
        ),
      ),
    );
  }
}
