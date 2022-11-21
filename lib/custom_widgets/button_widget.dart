import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget(
      {required this.label,
      required this.colors,
      required this.onTap,
      this.fontSize,
      this.fontColor,
      this.width,
      this.height,
      this.fromLeftPaddin,
      this.fromTopPaddin,
      this.frombottomPaddin,
      this.showBorder,
      this.leading,
      Key? key})
      : super(key: key);

  String label;
  List<Color> colors;
  void Function() onTap;
  double? fontSize;
  Color? fontColor;
  double? width;
  double? height;
  double? fromLeftPaddin;
  double? fromTopPaddin;
  double? frombottomPaddin;
  bool? showBorder;
  Widget? leading;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: this.width ?? width * 0.9 * 1,
        height: this.height ?? height * 0.07 * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width * 0.04),
          border: showBorder ?? false
              ? Border.all(color: const Color(0XFFb4bc07), width: width * 0.001)
              : const Border(),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: colors,
          ),
        ),
        child: ListTile(
          leading: leading,
          title: Padding(
            padding: EdgeInsets.only(
                left: fromLeftPaddin ?? width * 0.4,
                top: fromTopPaddin ?? height * 0.02,
                bottom: frombottomPaddin ?? height * 0.02),
            child: Text(
              label,
              maxLines: 2,
              overflow: TextOverflow.visible,
              style: TextStyle(
                  fontFamily: 'Acme',
                  fontSize: fontSize ?? 15,
                  color: fontColor ?? Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
