import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quize_u/check_net/check_net_page.dart';
import 'package:quize_u/question_quize/question_page.dart';

class HomeProvider extends ChangeNotifier {
  homeCheckNet({required BuildContext context}) async {
    try {
      var result = await InternetAddress.lookup('google.com');
      if (result.length == 2) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const QuestionPage()));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => CheckNetPage(
                      fromWhere: 'home',
                    )));
      }
    } catch (e) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => CheckNetPage(
                    fromWhere: 'home',
                  )));
    }
  }
}
