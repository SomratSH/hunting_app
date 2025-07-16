import 'package:flutter/material.dart';
import 'package:hunting_app/common/text_style_custom.dart';
import 'package:hunting_app/common/custom_padding.dart';

class FeaturedItem extends StatelessWidget {
  final String imagePath;
  final String categoryName;
  final String title;
  final String subtitle;
  final double imageHeight;
  // final double imageWidth;
  final Color categoryColor;
  final Color textColor;

  const FeaturedItem({
    Key? key,
    required this.imagePath,
    required this.categoryName,
    required this.title,
    required this.subtitle,
    this.imageHeight = 120,
    // this.imageWidth = 190,
    this.categoryColor = const Color(0xffC89800),
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image at the background
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(10),
          
          child: Image.asset(
            imagePath,
            height: imageHeight,
            // width: imageWidth,
            fit: BoxFit.fitHeight,
          ),
        ),
        Positioned(
          bottom: 5,
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Category label
              DecoratedBox(
                decoration: BoxDecoration(
                  color: categoryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    categoryName,
                    style: customTextStyleAuth(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: textColor,
                    ),
                  ),
                ),
              ),
              vPad5,
              // Title text
              Text(
                title,
                style: customTextStyleAuth(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              vPad5,
              // Subtitle text
              Text(
                "\$$subtitle",
                style: customTextStyleAuth(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
