import 'package:flutter/material.dart';
import 'package:hunting_app/common/text_style_custom.dart';

class TermsTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign? textAlign;

  const TermsTextWidget({
    super.key,
    required this.text,
    this.fontSize = 13,
    this.fontWeight = FontWeight.w400,
    this.color = Colors.white,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: customTextStyleAuth(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
      textAlign: textAlign,
    );
  }
}
