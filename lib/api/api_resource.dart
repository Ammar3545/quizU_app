import 'dart:convert';
import 'dart:developer';

import 'package:quize_u/models/question_model.dart';
import 'package:quize_u/shredpreference/sharedpreference_link.dart';
import 'package:quize_u/static/static_property.dart';
import 'api_link_method.dart';

class ApiResource {
  Future<String> loginAndRegisterPlayer(
      {required String name, required String email}) async {
    var response = await ApiLinkMethod().postMethod(
        url: StaticProperty().url,
        body: jsonEncode(<String, dynamic>{'Name': name, 'Email': email}));
    log(response.toString() + 'from api resource');
    SharedPreferencesLink()
        .saveTokenInSharedPreferences(key: 'token', token: response['data']);
    return response['message'] ?? '';
  }

  addplayerScore({required int score}) async {
    String token = await SharedPreferencesLink()
        .getTokenFromSharedPreferences(key: 'token');
    var response = await ApiLinkMethod().postMethod(
        url: StaticProperty().url + 'AddScore',
        body:
            jsonEncode(<String, dynamic>{'TokenLink': token, 'Score': score}));
    log(response.toString());
  }

  Future<List> getPlayerScore() async {
    String token = await SharedPreferencesLink()
        .getTokenFromSharedPreferences(key: 'token');
    var response = await ApiLinkMethod().getMethod(
        url: StaticProperty().url + 'scores',
        header: {'Authorization': 'Bearer $token'});
    log(response.toString());
    return response['data'] ?? [];
  }

  Future<QuestionModel> getQuestions() async {
    List<QuestionModel> question = [];
    var response =
        await ApiLinkMethod().getMethod(url: StaticProperty().url, header: {});

    var object = QuestionModel.fromJson(response);
    object.data.forEach((element) {
      log(element.question);
      log(element.option1);
      log(element.option2);
      log(element.option3);
      log(element.option4);
      log(element.answer);
    });
    return object;
  }
}
