import 'package:flutter/material.dart';

class TitleContaier extends StatelessWidget {
  final String title;
  final Widget child;
  final double padding;
  final Color bgColor;

  const TitleContaier({super.key, required this.title, required this.child, this.padding = 8, this.bgColor = Colors.blueAccent});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
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
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
