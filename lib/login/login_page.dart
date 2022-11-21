import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quize_u/custom_widgets/button_widget.dart';
import 'package:quize_u/custom_widgets/text_field_widget.dart';
import 'package:quize_u/login/provider/login_proivder.dart';
import 'package:quize_u/static/static_property.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final stateLoginKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Consumer<LoginProvider>(
      builder: (context, loginProvider, child) => Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: width,
            height: height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0XFF3492f4),
                    Color(0XFF5771ec),
                  ]),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.2,
                ),
                Stack(
                  children: [
                    Positioned(
                      top: height * 0.06,
                      left: width * 0.5,
                      child: Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.white,
                              blurRadius: width * 0.4,
                              spreadRadius: width * 0.3 * 0.8),
                        ]),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/quiz-title.png',
                        width: width * 0.6,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.06,
                ),
                Form(
                  key: stateLoginKey,
                  child: Column(
                    children: [
                      TextFieldWidget(
                        controller: nameController,
                        hintText: 'Name',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'This Field is required';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      TextFieldWidget(
                        controller: emailController,
                        hintText: 'Email',
                        validator: (value) {
                          RegExp regex = RegExp(StaticProperty().pattern);
                          if (value!.isEmpty) {
                            return 'This Field is required';
                          }
                          if (!regex.hasMatch(value)) {
                            return 'Please enter valid Email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: height * 0.2,
                      ),
                    ],
                  ),
                ),
                ButtonWidget(
                  label: 'Login',
                  colors: const [Color(0XFFf1d603), Color(0XFFb4bc07)],
                  fontSize: width * 0.06,
                  frombottomPaddin: height * 0.001,
                  fromTopPaddin: 0,
                  fromLeftPaddin: width * 0.4 * 0.88,
                  onTap: () {
                    log('login');
                    if (stateLoginKey.currentState!.validate()) {
                      log('no error');
                      loginProvider.manageUserLogin(
                        email: emailController.text,
                        name: nameController.text,
                        context: context,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
