import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextfieldBg extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final Color backgroundColor;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final String? prefixIconSvgPath;
  final Color borderColor;
  final double borderRadius;
  final Color hintTextColor; // <-- New parameter

  const CustomTextfieldBg({
    super.key,
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    this.backgroundColor = const Color(0xff111827),
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.prefixIconSvgPath,
    this.borderColor = const Color(0xff464F57),
    this.borderRadius = 5.0,
    this.hintTextColor = Colors.grey, // <-- Default value
  });

  @override
  _CustomTextfieldBgState createState() => _CustomTextfieldBgState();
}

class _CustomTextfieldBgState extends State<CustomTextfieldBg> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        border: Border.all(color: widget.borderColor),
      ),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.isPassword ? _obscureText : false,
        keyboardType: widget.keyboardType,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(color: widget.hintTextColor), // <-- Applied here
          filled: true,
          fillColor: widget.backgroundColor,
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off_rounded : Icons.visibility_outlined,
                    color: const Color(0xff9E9E9E),
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : widget.suffixIcon,
          prefixIcon: widget.prefixIconSvgPath != null
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    widget.prefixIconSvgPath!,
                    height: 15,
                    width: 15,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
