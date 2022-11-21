// To parse this JSON data, do
//
//     final questionModel = questionModelFromJson(jsonString);

import 'dart:convert';

QuestionModel questionModelFromJson(String str) =>
    QuestionModel.fromJson(json.decode(str));

String questionModelToJson(QuestionModel data) => json.encode(data.toJson());

class QuestionModel {
  QuestionModel({
    required this.data,
    required this.success,
    required this.message,
  });

  List<Data> data;
  bool success;
  String message;

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "success": success,
        "message": message,
      };
}

class Data {
  Data({
    required this.question,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
    required this.answer,
  });

  String question;
  String option1;
  String option2;
  String option3;
  String option4;
  String answer;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        question: json["question"],
        option1: json["option1"],
        option2: json["option2"],
        option3: json["option3"],
        option4: json["option4"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "option1": option1,
        "option2": option2,
        "option3": option3,
        "option4": option4,
        "answer": answer,
      };
}
