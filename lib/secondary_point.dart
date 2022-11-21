import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quize_u/check_net/provider/check_net_provider.dart';
import 'package:quize_u/home/provider/home_provider.dart';
import 'package:quize_u/login/provider/login_proivder.dart';
import 'package:quize_u/profile/provider/profile_proivder.dart';
import 'package:quize_u/question_quize/provider/question_provider.dart';
import 'package:quize_u/score_board/provider/scoreboard_provider.dart';
import 'package:quize_u/splash_screen.dart';

class SecondaryPoint extends StatelessWidget {
  const SecondaryPoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => QuestionProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ScoreboardProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CheckNetProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QuizU',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
