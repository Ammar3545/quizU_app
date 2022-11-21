import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quize_u/api/api_resource.dart';
import 'package:quize_u/custom_widgets/custom_timer_painter.dart';
import 'package:quize_u/question_quize/provider/question_provider.dart';
import 'package:quize_u/win_page/win_page.dart';

class CountDownTimer extends StatefulWidget {
  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}

late AnimationController controller;

class _CountDownTimerState extends State<CountDownTimer>
    with TickerProviderStateMixin {
  bool isDone = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(minutes: 2),
    );

    timer() async {
      await Future.delayed(
        controller.duration!,
      );
      isDone = true;
      if (isDone) {
        if (mounted) {
          ApiResource().addplayerScore(
              score: Provider.of<QuestionProvider>(context, listen: false)
                  .totalScore);
          Provider.of<QuestionProvider>(context, listen: false).totalScore = 0;
          Provider.of<QuestionProvider>(context, listen: false).randomIndex = 0;
          Provider.of<QuestionProvider>(context, listen: false).show = true;
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const WinPage()));
        }
      }
    }

    timer();

    start() {
      if (controller.isAnimating) {
        controller.stop();
      } else {
        controller.reverse(
            from: controller.value == 0.0 ? 1.0 : controller.value);
      }
    }

    start();
  }

  String get timerString {
    Duration duration = controller.duration! * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Stack(
              children: <Widget>[
                AnimatedBuilder(
                  animation: controller,
                  builder: (BuildContext context, child) {
                    return Center(
                      child: AspectRatio(
                        aspectRatio: 1.0,
                        child: Container(
                          margin: EdgeInsets.all(height * 0.2 * 0.8),
                          child: CustomPaint(
                              painter: CustomTimerPainter(
                            animation: controller,
                            backgroundColor: Colors.white,
                            color: const Color(0XFFb4bc07),
                          )),
                        ),
                      ),
                    );
                  },
                ),
                Positioned(
                  left: width * 0.6 * 0.96 * 0.8,
                  top: height * 0.4 * 0.82 * 0.6,
                  child: AnimatedBuilder(
                      animation: controller,
                      builder: (BuildContext context, child) {
                        return Text(
                          timerString,
                          style: TextStyle(
                              fontSize: width * 0.04,
                              color: const Color(0XFF9e9596)),
                        );
                      }),
                ),
              ],
            );
          }),
    );
  }
}
