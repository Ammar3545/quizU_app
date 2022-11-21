import 'package:flutter/material.dart';
import 'package:quize_u/intermediary_point.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashGO() async {
      await Future.delayed(const Duration(seconds: 2));
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const IntermediaryPoint()));
    }

    splashGO();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0XFFf1d603), Color(0XFFb4bc07)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset('assets/splash_quiz3.png')],
          ),
        ),
      ),
    );
  }
}
