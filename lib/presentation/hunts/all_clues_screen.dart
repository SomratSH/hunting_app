import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hunting_app/common/custom_padding.dart';
import 'package:hunting_app/constant/app_colors.dart';
import 'package:hunting_app/constant/app_const.dart';

import '../../common/enum.dart';
import '../../common/text_style_custom.dart';
import 'clues_screen.dart';
import 'widget/custom_clues_card.dart';

class AllCluesScreen extends StatelessWidget {
  int ?index;
  AllCluesScreen({super.key, this.index});

  @override
  Widget build(BuildContext context) {
    final totalClues = data[index!].clues.length;
final completedClues = data[index!]
    .clues
    .where((clue) => clue.status == ClueStatus.completed)
    .length;
final progress = completedClues / totalClues;

    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                      "All Clues",
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
              vPad10,
              Text(
                data[index!].title,
                style: customTextStyleAuth(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color((0xff97BECA)),
                ),
              ),
              vPad5,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icon/map.svg"),
                  hPad5,
                  Text(
                    "${data[index!].location.toString()}",
                    style: customTextStyleAuth(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff9E9E9E),
                    ),
                  ),
                ],
              ),
              vPad10,
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xff111827CC),
                  borderRadius: BorderRadius.circular(7),
                ),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Progress',
                          style: customTextStyleAuth(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xff030712),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            '${completedClues}/${totalClues} clues solved',
                            style: customTextStyleAuth(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff97BECA),
                            ),
                          ),
                        ),
                      ],
                    ),
                    vPad20,
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child:  LinearProgressIndicator(
                        value: progress, // 100%
                        minHeight: 10,
                        backgroundColor: Colors.grey,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xff123D74),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              vPad10,
             
              Column(
                children: List.generate(data[index!].clues.length, (i){
                  final clues = data[index!].clues[i];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClueCard(
                                    clueNumber: i + 1,
                                    title: clues.title,
                                    description:
                      "Look for the ancient flame that never dies in the heart \nof South Africa",
                                    status:  clues.status,
                                     onViewClue: () {
                  print("---");
                  clues.status == ClueStatus.inProgress ?  Navigator.push(context, MaterialPageRoute(builder: (_)=> CluesScreen(index: index,))) : null;
                },
                                  ),
                  );
                }     ),
              )
             
            
            ],
          ),
        ),
      ),
    );
  }
}
