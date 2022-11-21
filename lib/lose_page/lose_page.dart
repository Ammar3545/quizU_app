import 'package:flutter/material.dart';
import 'package:quize_u/custom_widgets/button_widget.dart';
import 'package:quize_u/terminal_point.dart';

class LosePage extends StatelessWidget {
  const LosePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/try_again.jpg',
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: height * 0.2 * 0.7),
              child: Text(
                'Try Again',
                style: TextStyle(
                    fontFamily: 'Acme',
                    fontSize: width * 0.1,
                    color: const Color(0XFF9e9596)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: height * 0.05),
              child: ButtonWidget(
                label: 'Home',
                colors: const [
                  Color(0XFFf1d603),
                  Color(0XFFb4bc07),
                ],
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => TerminalPoint()));
                },
                width: width * 0.2,
                fromLeftPaddin: width * 0.02,
              ),
            )
          ],
        ),
      ),
    );
  }
}
