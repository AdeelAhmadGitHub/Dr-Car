// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget widget;
  const CustomContainer({required this.widget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.red,
                  Colors.lightBlueAccent,
                ],
                tileMode: TileMode.clamp)),
        child: widget,
      ),
    );
  }
}
