import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? fontColor;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final TextOverflow? textOverflow;
  final int? maxLine;
  final bool? softWrap;

  const CustomText(
      {super.key,
      @required this.text,
      this.fontWeight,
      this.fontSize,
      this.fontColor,
      this.textAlign,
      this.letterSpacing,
      this.textOverflow,
      this.maxLine,
      this.softWrap});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLine,
      softWrap: softWrap,
      style: TextStyle(
        // overflow: textOverflow,
        fontWeight: fontWeight,
        fontSize: fontSize,
        fontFamily: "Inter",
        color: fontColor,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
