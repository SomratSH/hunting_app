import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hunting_app/constant/app_colors.dart';

TextStyle customTextStyle({FontWeight fontWeight = FontWeight.w700, double fontSize = 24.0}) {
  return GoogleFonts.roboto(
    fontWeight: fontWeight,
    fontSize: fontSize,
    color: Colors.white,
    
  );
}
TextStyle customTextStyleAuth({
  FontWeight fontWeight = FontWeight.w700,
  double fontSize = 24.0,
  Color color = Colors.white, // Default color is white
}) {
  return GoogleFonts.poppins(
    fontWeight: fontWeight,
    fontSize: fontSize,
    color: color, // Apply the custom color
  );
}


TextStyle customTextStyleWidget({
  FontWeight fontWeight = FontWeight.w400,
  double fontSize = 24.0,
  Color color = textLightColor, // Default color is white
}) {
  return GoogleFonts.poppins(
    fontWeight: fontWeight,
    fontSize: fontSize,
    color: color, // Apply the custom color
  );
}