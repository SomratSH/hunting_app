import 'package:flutter/material.dart';
import 'package:hunting_app/common/custom_padding.dart';
import 'package:hunting_app/common/text_style_custom.dart';
import 'package:hunting_app/constant/app_colors.dart';

import '../../../common/enum.dart';

class ClueCard extends StatelessWidget {
  final int clueNumber;
  final String title;
  final String description;
  final ClueStatus status;
  final Function()? onViewClue;

  const ClueCard({
    super.key,
    required this.clueNumber,
    required this.title,
    required this.description,
    required this.status,
    this.onViewClue,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    String statusText;

    switch (status) {
      case ClueStatus.completed:
        statusColor = green;
        statusText = "Completed";
        break;
      case ClueStatus.inProgress:
        statusColor = inProgess;
        statusText = "In Progress";
        break;
      case ClueStatus.locked:
        statusColor = text2;
        statusText = "Locked";
        break;
    
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xff111827CC),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Top Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      status == ClueStatus.locked
                          ? Icons.lock :status == ClueStatus.inProgress ? Icons.hourglass_bottom_outlined
                          : Icons.check_box,
                      color: status == ClueStatus.locked
                          ? Colors.grey : status == ClueStatus.inProgress ?  inProgess
                          : Colors.green,
                    ),
                    const SizedBox(width: 5),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          "$clueNumber",
                          style: const TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Clue $clueNumber:",
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),

                /// Status Badge
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: Text(
                      statusText,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            /// Clue Title
          
              Text(
                "\"$title\"",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),

            /// Description
     
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  description,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                    color: Colors.grey,
                  ),
                ),
              ),
            vPad10,
            /// View Clue Button (only for inProgress)
            // if (status == ClueStatus.inProgress && onViewClue != null && ClueStatus.locked == status)

            InkWell(
              onTap: onViewClue,
              child: DecoratedBox(decoration: BoxDecoration(
                color: inProgess,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
                child: Text("View Clue", style: customTextStyle(fontSize: 14, fontWeight: FontWeight.w700),),
              ),
              ),
            ),
             
          ],
        ),
      ),
    );
  }
}
