import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quize_u/api/api_resource.dart';
import 'package:quize_u/custom_widgets/timer_countdown.dart';
import 'package:quize_u/lose_page/lose_page.dart';
import 'package:quize_u/models/question_model.dart';
import 'package:quize_u/win_page/win_page.dart';

class QuestionProvider extends ChangeNotifier {
  late QuestionModel questions;
  late bool _loading;
  int totalScore = 0;
  int questionIndex = 0;
  int randomIndex = 0;
  bool show = true;
  bool win = false;
  bool lose = false;
  List randomList = [];

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  getQuestion() async {
    loading = true;
    questions = await ApiResource().getQuestions();
    loading = false;
  }

  checkQuestion(
      {required String answer,
      required String userAnswer,
      required BuildContext context}) {
    if (userAnswer == answer) {
      totalScore += 10;
      questionIndex = randomList.elementAt(randomIndex);
    } else {
      lose = true;
      totalScore = 0;
      randomIndex = 0;
      show = true;
      controller.stop();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LosePage()));
    }

    if (randomIndex != 28) {
      randomIndex++;
    } else {
      win = true;
      ApiResource().addplayerScore(score: totalScore);
      totalScore = 0;
      randomIndex = 0;
      show = true;
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const WinPage()));
    }
    notifyListeners();
  }

  skipButton({required BuildContext context}) {
    randomIndex++;
    questionIndex = randomList.elementAt(randomIndex);
    show = false;
    if (randomIndex == 29) {
      ApiResource().addplayerScore(score: totalScore);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const WinPage()));
    }
    notifyListeners();
  }

  generateRandom() {
    Random random = Random();
    while (randomList.length < 30) {
      int randomNumber = random.nextInt(30);
      if (!randomList.contains(randomNumber)) {
        randomList.add(randomNumber);
      }
    }
    randomList.remove(0);
  }
}
