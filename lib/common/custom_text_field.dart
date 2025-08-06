import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  // final Color backgroundColor;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final String? prefixIconSvgPath;  // For SVG prefix icon
  final Color borderColor;
  final double borderRadius;
  final List<Color> borderColors;  // For gradient border colors
  // final List<Color> backgroundColors;  // For gradient background colors

  const CustomTextField({
    super.key, 
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    // this.backgroundColor
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.prefixIconSvgPath,  // Accept SVG path for prefix icon
    this.borderColor = Colors.blue,
    this.borderRadius = 5.0,
    this.borderColors = const [Color(0xff464F57), Color(0xff292F36)], // Default gradient border colors
    // this.backgroundColors = const [Color(0xff111827), Color(0xff14191F)], // Default gradient background colors
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      // Outer container with a gradient border
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        color:  Color.lerp(Color(0xFF111827), Color(0xFF14191F), 0.5)!,
      
      ),
      child: TextField(
        
        controller: widget.controller,
        obscureText: widget.isPassword ? _obscureText : false,
        keyboardType: widget.keyboardType,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor:  Color.lerp(Color(0xFF111827), Color(0xFF14191F), 0.5)!, // Transparent background for TextField
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          border: InputBorder.none,  // No border for TextField itself
          focusedBorder: InputBorder.none,  // No border when focused
          enabledBorder: InputBorder.none,  // No border when enabled
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off_rounded : Icons.visibility_outlined,
                    color: Color(0xff9E9E9E),
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : widget.suffixIcon,  // Default suffixIcon when not password
          prefixIcon: widget.prefixIconSvgPath != null
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    widget.prefixIconSvgPath!, // SVG asset path
                    height: 15, // You can adjust the size as needed
                    width: 15,
                  ),
                )
              : null, // If no SVG is provided, no prefix icon
        ),
      ),
    );
  }
}
