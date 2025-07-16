import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hunting_app/common/text_style_custom.dart';

class CustomButtonWithSvg extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  final double borderRadius;
  final Color color;
  final bool isWidth;
  final String? svgIcon; // Changed from IconData to String for SVG path

  const CustomButtonWithSvg({
    super.key,
    required this.buttonText,
    this.onPressed,
    this.isWidth = true,  // Default is to take full width
    this.borderRadius = 5.0,  // Default border radius
    this.color = const Color(0xff2765A1),  // Default color
    this.svgIcon,  // SVG icon path property
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,  // Triggers the callback when tapped
      child: Container(
        width: isWidth ? double.infinity : null,  // Full width or text-based width
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xff97BECA)),
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),  // Rounded corners
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,  // Center the content horizontally
            children: [
              if (svgIcon != null) ...[ // If the SVG icon is provided, show it
                SvgPicture.asset(
                  svgIcon!,
                  color: Colors.white,  // Icon color
                  width: 20.0,  // Adjust icon width
                  height: 20.0,  // Adjust icon height
                ),
                SizedBox(width: 8), // Add spacing between the icon and the text
              ],
              Text(
                buttonText,
                style: customTextStyleAuth(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,  // Text color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}