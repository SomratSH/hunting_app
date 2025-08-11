import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hunting_app/common/custom_padding.dart';
import 'package:hunting_app/constant/app_colors.dart';
import 'package:hunting_app/constant/app_const.dart';
import 'package:hunting_app/presentation/home_screen/home_provider.dart';
import 'package:provider/provider.dart';

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
    final provider = context.watch<HomeProvider>();
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
                provider.huntsList.results![index!].title.toString(),
                textAlign: TextAlign.center,
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
                    "${provider.huntsList.results![index!].city.toString()}",
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
                            '${completedClues}/${provider.huntsList.results![index!].clues!.length} clues solved',
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
                children: List.generate(provider.huntsList.results![index!].clues!.length, (i){
                  final clues = provider.huntsList.results![index!].clues![i];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClueCard(
                                    clueNumber: i + 1,
                                    title: clues.name.toString(),
                                    description:
                      clues.riddle.toString(),
                                    status: clues.isLocked == true ?   ClueStatus.locked : clues.status == "active" ? ClueStatus.inProgress : ClueStatus.locked,
                                     onViewClue: () {
                  print("---");
                   Navigator.push(context, MaterialPageRoute(builder: (_)=> CluesScreen(clues: provider.huntsList.results![index!].clues!,index: i,))) ;
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
