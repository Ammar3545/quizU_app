import 'package:flutter/material.dart';

class CircleWidget extends StatelessWidget {
  CircleWidget(
      {required this.child,
      required this.child2,
      required this.borderColor,
      required this.radius,
      required this.colors,
      required this.width,
      required this.height,
      required this.topPosition,
      required this.leftPosition,
      Key? key})
      : super(key: key);

  Color borderColor;
  List<Color> colors;
  double radius;
  double width;
  double height;
  Widget child;
  Widget child2;
  double topPosition;
  double leftPosition;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: height * 1.1,
        ),
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(color: borderColor, width: width / 35),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: colors),
          ),
          child: child,
        ),
        Positioned(
          top: topPosition,
          left: leftPosition,
          child: Container(
            width: width / 5,
            height: height / 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    borderColor,
                    borderColor,
                  ]),
            ),
            child: child2,
          ),
        ),
      ],
    );
  }
}
