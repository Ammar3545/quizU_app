import 'package:flutter/cupertino.dart';
import 'package:quize_u/api/api_resource.dart';

class ScoreboardProvider extends ChangeNotifier {
  List playerScore = [];
  List topScore = [];
  late bool _loading;

  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  getPlayerScore() async {
    loading = true;
    playerScore = await ApiResource().getPlayerScore();
    playerScore.sort();
    playerScore = playerScore.reversed.toList();
    if (playerScore.length >= 3) {
      topScore.clear();
      for (var i = 0; i < 3; i++) {
        topScore.add(playerScore[i]);
      }
      playerScore = playerScore.sublist(3);
    } else {
      topScore.clear();
      playerScore.addAll([0, 0, 0]);
      topScore.insert(0, playerScore[0]);
      topScore.insert(1, playerScore[1]);
      topScore.insert(2, playerScore[2]);
      playerScore.clear();
    }
    loading = false;
  }
}
