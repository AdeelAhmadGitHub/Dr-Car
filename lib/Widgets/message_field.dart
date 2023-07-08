import 'package:flutter/material.dart';

class CustomMessageField extends StatelessWidget {
  final double? height;
  final double? width;
  final String? hintText;
  final Widget? textFieldIcon;
  final Color? hintTextColor;
  final TextInputType? inputType;
  final int? characterLength;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function()? onTap;

  const CustomMessageField({
    Key? key,
    this.height,
    this.hintTextColor,
    this.width,
    this.hintText,
    this.textFieldIcon,
    this.inputType,
    this.characterLength,
    this.controller,
    this.onChanged,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: true,
        child: TextFormField(
          maxLines: null,
          onChanged: onChanged,
          controller: controller,
          textAlign: TextAlign.start,
          keyboardType: TextInputType.text,
          maxLength: characterLength,
          onTap: onTap!,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: textFieldIcon,
            hintStyle: TextStyle(color: hintTextColor),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(width: 0, color: Color(0xffD9D9D9)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(width: 0, color: Color(0xffD9D9D9)),
            ),
          ),
        ),
      ),
    );
  }
}

class MessageTextField extends StatelessWidget {
  final double? height;
  final double? width;
  final String? hintText;
  final Widget? textFieldIcon;
  final Color? hintTextColor;
  final TextInputType? inputType;
  final int? characterLength;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  const MessageTextField({
    Key? key,
    this.height,
    this.hintTextColor,
    this.width,
    this.hintText,
    this.textFieldIcon,
    this.inputType,
    this.characterLength,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          reverse: true,
          child: TextFormField(
            // expands: true,
            maxLines: null,
            decoration: const InputDecoration.collapsed(
              hintText: 'Type Your Message',
            ),
          ),
        ),
      ),
    );
  }
}
