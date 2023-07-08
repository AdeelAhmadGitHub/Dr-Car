// ignore_for_file: use_key_in_widget_constructors
import 'package:dr_cars/Widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  final double borderRadius;
  final double textSize;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback onPressed;
  final FontWeight textFontWeight;

  const CustomButton(
      {required this.text,
      this.borderRadius = 30,
      this.height = 40,
      this.width = double.infinity,
      this.textSize = 16,
      this.buttonColor = const Color(0xffFFFFFF),
      this.textColor = const Color(0xff584B4B),
      required this.onPressed,
      this.textFontWeight = FontWeight.w600});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
      minWidth: width,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        side: BorderSide( color: Colors.white,),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      color: buttonColor,
      child: Center(
        child: CustomText(
          text: text,
          fontSize: textSize,
          fontWeight: textFontWeight,
          fontColor: textColor,
        ),
      ),
    );
  }
}
