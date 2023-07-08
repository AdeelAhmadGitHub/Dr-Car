import 'package:dr_cars/Widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomToggleButtons extends StatefulWidget {
  final List<String> titles;
  final Function(int) onPressed;

  CustomToggleButtons({
    required this.titles,
    required this.onPressed,
  });

  @override
  _CustomToggleButtonsState createState() => _CustomToggleButtonsState();
}

class _CustomToggleButtonsState extends State<CustomToggleButtons> {
  late List<bool> isSelected;

  @override
  void initState() {
    isSelected = List.generate(widget.titles.length, (_) => false);
    print("???????????????????");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.w,
      height: 33.h,
      child: ToggleButtons(
        isSelected: isSelected,
        borderRadius: BorderRadius.circular(5),
        borderWidth: 2,
        borderColor: const Color(0xff179802),
        disabledColor: Colors.white,
        selectedBorderColor: const Color(0xff179802),
        color: const Color(0xff179802),
        selectedColor: Colors.white,
        fillColor: const Color(0xff179802),
        children: widget.titles.map((title) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 2),
            child: CustomText(
              text: title,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          );
        }).toList(),
        onPressed: (int newIndex) {
          print(newIndex);
          setState(() {
            for (int index = 0; index < isSelected.length; index++) {
              if (index == newIndex) {
                isSelected[index] = true;
              } else {
                isSelected[index] = false;
              }
            }
          });
          widget.onPressed(newIndex);
        },
      ),
    );
  }
}
