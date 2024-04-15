import 'package:flutter/material.dart';

class TitleContaier extends StatelessWidget {
  final String title;
  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color bgColor;
  final BoxDecoration? decoration;
  final Color titleTextColor;
  final double titleTextSize;

  const TitleContaier(
      {super.key,
      required this.title,
      required this.child,
      this.padding = const EdgeInsets.all(8),
      this.bgColor = Colors.blueAccent,
      this.decoration,
      this.titleTextColor = Colors.white,
      this.titleTextSize = 14});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          padding: padding,
          decoration: decoration ??
              BoxDecoration(
                border: Border.all(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(4.0),
              ),
          child: child,
        ),
        Positioned(
          left: 10,
          right: 10,
          top: 0,
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.only(left: 4, right: 4),
              color: bgColor,
              child: Text(
                title,
                style: TextStyle(color: titleTextColor, fontSize: titleTextSize),
              ),
            ),
          ),
        )
      ],
    );
  }
}
