import 'package:flutter/material.dart';
import 'package:hunting_app/common/text_style_custom.dart';

class CustomButtonWithoutWidth extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  final double borderRadius;
  final Color color;


  const CustomButtonWithoutWidth({
    super.key,
    required this.buttonText,
    this.onPressed,
 
    this.borderRadius = 5.0,  // Default border radius
    this.color = const Color(0xff2765A1),  // Default color
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,  
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xff97BECA)),
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),  // Rounded corners
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(  // Center the text within the button
            child: Text(
              buttonText,
              style: customTextStyleAuth(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
