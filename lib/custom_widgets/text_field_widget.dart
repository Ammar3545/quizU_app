import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget(
      {required this.controller,
      required this.hintText,
      required this.validator,
      Key? key})
      : super(key: key);

  TextEditingController controller;
  String hintText;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.06,
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.04,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(width * 0.04)),
      child: TextFormField(
        controller: controller,
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(fontFamily: 'Acme'),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(fontFamily: 'Acme'),
          border: InputBorder.none,
          contentPadding:
              EdgeInsets.only(left: width * 0.04, top: width * 0.01),
        ),
        validator: validator,
      ),
    );
  }
}
