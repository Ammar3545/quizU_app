import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quize_u/question_quize/question_page.dart';
import 'package:quize_u/terminal_point.dart';

class CheckNetProvider extends ChangeNotifier {
  late bool _loading;

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  checkConnection({required String from, required BuildContext context}) async {
    loading = true;
    try {
      var result = await InternetAddress.lookup('google.com');
      if (result.length == 2) {
        if (from == 'home') {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => QuestionPage()));
        } else if (from == 'score') {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => TerminalPoint(
                        indexPage: 1,
                      )));
        }
      } else {
        snackBarNotification(
            context: context,
            message: 'Please check your Internet Connection and try again');
      }
      await Future.delayed(const Duration(seconds: 1));
      loading = false;
    } catch (e) {
      await Future.delayed(const Duration(seconds: 1));
      snackBarNotification(
          context: context,
          message: 'Please check your Internet Connection and try again');
      loading = false;
    }
  }

  snackBarNotification(
      {required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.red),
        ),
        duration: const Duration(seconds: 5),
        backgroundColor: Colors.black,
      ),
    );
  }
}
