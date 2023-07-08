import 'package:flutter/material.dart';

class CustomRadio extends StatelessWidget {
  final int value;
  final int groupValue;
  final Function onChanged;

  const CustomRadio({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(value);
      },
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: value == groupValue ? Color(0xff4D96F5) : Colors.transparent,
          border: Border.all(
            color: Colors.white,
            width: 2.0,
          ),
        ),
        child: value == groupValue
            ? Icon(
                Icons.check,
                size: 14,
                color: Colors.white,
              )
            : Container(),
      ),
    );
  }
}
