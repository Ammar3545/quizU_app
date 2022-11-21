import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quize_u/custom_widgets/button_widget.dart';
import 'package:quize_u/home/provider/home_provider.dart';
import 'package:quize_u/static/static_property.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.06,
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Let`s Play',
                  style: TextStyle(
                      fontFamily: 'Acme',
                      fontSize: width * 0.1,
                      color: const Color(0XFFf99bad)),
                ),
                Text(
                  'Be The First!',
                  style: TextStyle(
                      fontFamily: 'Acme',
                      fontSize: width * 0.05,
                      color: const Color(0XFF9e9596)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Image.asset('assets/wait.png'),
          Padding(
            padding: EdgeInsets.only(left: width * 0.04, top: height * 0.03),
            child: Text(
              StaticProperty().tips,
              style: const TextStyle(
                  fontFamily: 'AmiBold', color: Color(0XFF9e9596)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.2 * 0.6),
            child: Center(
                child: ButtonWidget(
              label: 'Start',
              colors: const [Color(0XFFf1d603), Color(0XFFb4bc07)],
              width: width * 0.3,
              height: height * 0.04,
              onTap: () {
                Provider.of<HomeProvider>(context, listen: false)
                    .homeCheckNet(context: context);
              },
              fromLeftPaddin: width * 0.2 * 0.4,
              fromTopPaddin: 0,
              frombottomPaddin: height * 0.02,
            )),
          )
        ],
      ),
    );
  }
}
