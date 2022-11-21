import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quize_u/custom_widgets/button_widget.dart';
import 'package:quize_u/custom_widgets/timer_countdown.dart';
import 'package:quize_u/question_quize/provider/question_provider.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<QuestionProvider>(context, listen: false).getQuestion();
    Provider.of<QuestionProvider>(context, listen: false).generateRandom();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        controller.stop();
        Provider.of<QuestionProvider>(context, listen: false).show = true;
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<QuestionProvider>(
          builder: (context, questionProvider, child) => questionProvider
                  .loading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Expanded(child: CountDownTimer()),
                    Padding(
                      padding: EdgeInsets.only(bottom: height * 0.1),
                      child: Column(
                        children: [
                          ButtonWidget(
                            label: questionProvider
                                    .questions
                                    .data[questionProvider.questionIndex]
                                    .question +
                                ' ?',
                            colors: const [
                              Color(0XFFffffff),
                              Color(0XFFffffff),
                            ],
                            onTap: () {},
                            fontColor: const Color(0XFF9e9596),
                            fromLeftPaddin: width * 0.07,
                            fromTopPaddin: height * 0.01,
                            showBorder: true,
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          ButtonWidget(
                            label: questionProvider.questions
                                .data[questionProvider.questionIndex].option1,
                            colors: const [
                              Color(0XFFffffff),
                              Color(0XFFffffff),
                            ],
                            onTap: () {
                              questionProvider.checkQuestion(
                                  answer: questionProvider
                                      .questions
                                      .data[questionProvider.questionIndex]
                                      .answer,
                                  userAnswer: questionProvider
                                      .questions
                                      .data[questionProvider.questionIndex]
                                      .option1,
                                  context: context);
                            },
                            fontColor: const Color(0XFF9e9596),
                            fromLeftPaddin: width * 0.07,
                            showBorder: true,
                            leading: CircleAvatar(
                              backgroundColor: const Color(0XFFf1d603),
                              radius: width * 0.04,
                              child: Text(
                                'a',
                                style: TextStyle(
                                    fontFamily: 'Acme',
                                    fontSize: width * 0.04,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          ButtonWidget(
                            label: questionProvider.questions
                                .data[questionProvider.questionIndex].option2,
                            colors: const [
                              Color(0XFFffffff),
                              Color(0XFFffffff),
                            ],
                            onTap: () {
                              questionProvider.checkQuestion(
                                  answer: questionProvider
                                      .questions
                                      .data[questionProvider.questionIndex]
                                      .answer,
                                  userAnswer: questionProvider
                                      .questions
                                      .data[questionProvider.questionIndex]
                                      .option2,
                                  context: context);
                            },
                            fontColor: const Color(0XFF9e9596),
                            fromLeftPaddin: width * 0.07,
                            showBorder: true,
                            leading: CircleAvatar(
                              backgroundColor: const Color(
                                0XFFb4bc07,
                              ),
                              radius: width * 0.04,
                              child: Text(
                                'b',
                                style: TextStyle(
                                    fontFamily: 'Acme',
                                    fontSize: width * 0.04,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          ButtonWidget(
                            label: questionProvider.questions
                                .data[questionProvider.questionIndex].option3,
                            colors: const [
                              Color(0XFFffffff),
                              Color(0XFFffffff),
                            ],
                            onTap: () {
                              questionProvider.checkQuestion(
                                  answer: questionProvider
                                      .questions
                                      .data[questionProvider.questionIndex]
                                      .answer,
                                  userAnswer: questionProvider
                                      .questions
                                      .data[questionProvider.questionIndex]
                                      .option3,
                                  context: context);
                            },
                            fontColor: const Color(0XFF9e9596),
                            fromLeftPaddin: width * 0.07,
                            showBorder: true,
                            leading: CircleAvatar(
                              backgroundColor: const Color(0XFFf1d603),
                              radius: width * 0.04,
                              child: Text(
                                'c',
                                style: TextStyle(
                                    fontFamily: 'Acme',
                                    fontSize: width * 0.04,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          ButtonWidget(
                            label: questionProvider.questions
                                .data[questionProvider.questionIndex].option4,
                            colors: const [
                              Color(0XFFffffff),
                              Color(0XFFffffff),
                            ],
                            onTap: () {
                              questionProvider.checkQuestion(
                                  answer: questionProvider
                                      .questions
                                      .data[questionProvider.questionIndex]
                                      .answer,
                                  userAnswer: questionProvider
                                      .questions
                                      .data[questionProvider.questionIndex]
                                      .option4,
                                  context: context);
                            },
                            fontColor: const Color(0XFF9e9596),
                            fromLeftPaddin: width * 0.07,
                            showBorder: true,
                            leading: CircleAvatar(
                              backgroundColor: const Color(
                                0XFFb4bc07,
                              ),
                              radius: width * 0.04,
                              child: Text(
                                'd',
                                style: TextStyle(
                                    fontFamily: 'Acme',
                                    fontSize: width * 0.04,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    questionProvider.show
                        ? Padding(
                            padding: EdgeInsets.only(bottom: height * 0.05),
                            child: ButtonWidget(
                              label: 'Skip',
                              colors: const [
                                Color(0XFFf1d603),
                                Color(0XFFb4bc07),
                              ],
                              onTap: () {
                                questionProvider.skipButton(context: context);
                              },
                              width: width * 0.2,
                              fromLeftPaddin: width * 0.04 * 0.9,
                            ),
                          )
                        : Container(
                            height: height * 0.2 * 0.55,
                          ),
                  ],
                ),
        ),
      ),
    );
  }
}
