import 'package:flutter/material.dart';
import 'package:hunting_app/common/text_style_custom.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  final double borderRadius;
  final Color color;
  final bool isWidth;
  final IconData? icon;
  final Color textColor;
  final bool iconAtStart; // <-- New property

  const CustomButton({
    super.key,
    required this.buttonText,
    this.onPressed,
    this.isWidth = true,
    this.borderRadius = 5.0,
    this.color = const Color(0xff2765A1),
    this.icon,
    this.textColor = Colors.white,
    this.iconAtStart = true, // <-- Default to icon at start
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: isWidth ? double.infinity : null,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff97BECA)),
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null && iconAtStart) ...[
                Icon(icon, color: textColor, size: 20.0),
                const SizedBox(width: 8),
              ],
              Text(
                buttonText,
                style: customTextStyleAuth(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
              if (icon != null && !iconAtStart) ...[
                const SizedBox(width: 8),
                Icon(icon, color: textColor, size: 20.0),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
