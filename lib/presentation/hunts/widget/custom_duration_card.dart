import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/text_style_custom.dart';

// Reusable custom duration card widget
class CustomDurationCard extends StatelessWidget {
  final String iconPath;
  final String duration;
  final String title;

  const CustomDurationCard({
    Key? key,
    required this.iconPath,
    required this.duration,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Color(0xff9E9E9E)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(iconPath), // Dynamic SVG icon
                SizedBox(width: 10),
                Text(
                  duration, // Dynamic duration value
                  style: customTextStyleAuth(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff97BECA),
                  ),
                ),
              ],
            ),
            Text(
              title, // Dynamic title
              style: customTextStyleAuth(
                fontSize: 19,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
