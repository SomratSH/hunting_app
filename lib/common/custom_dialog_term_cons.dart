import 'package:flutter/material.dart';
import 'package:hunting_app/common/text_style_custom.dart';
import 'package:hunting_app/constant/app_colors.dart';

void showTermConditionDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          decoration: BoxDecoration(
            color: blue1, // Dialog background color
            borderRadius: BorderRadius.circular(10),
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 25,
                ),
                child: Column(
                  children: [
                    Text(
                      "Terms & Condition",
                      style: customTextStyleAuth(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "You have to must agree to the terms & continue the process of create account",
                      style: customTextStyleAuth(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              const Divider(color: Colors.white24),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop(); // Cancel action
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    "Ok",
                    style: customTextStyleAuth(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
             
              // Row(
              //   children: [
              //     Expanded(
              //       child: InkWell(
              //         onTap: () {
              //           Navigator.of(context).pop(); // Cancel action
              //         },
              //         child: Container(
              //           alignment: Alignment.center,
              //           padding: const EdgeInsets.symmetric(vertical: 12),
              //           child: Text(
              //             "Cancel",
              //             style: customTextStyleAuth(
              //               fontSize: 16,
              //               fontWeight: FontWeight.w500,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //     Container(
              //       height: 40,
              //       width: 1,
              //       color: Colors.white24, // Vertical divider
              //     ),
              //     Expanded(
              //       child: InkWell(
              //         onTap: () {
              //           // Add delete action here
              //           Navigator.of(context).pop();
              //         },
              //         child: Container(
              //           alignment: Alignment.center,
              //           padding: const EdgeInsets.symmetric(vertical: 12),
              //           child: Text(
              //             "Delete",
              //             style: customTextStyleAuth(
              //               fontSize: 16,
              //               fontWeight: FontWeight.w500,
              //               color: Colors.redAccent,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            
            
            ],
          ),
        ),
      );
    },
  );
}
