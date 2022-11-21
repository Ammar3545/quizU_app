import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quize_u/check_net/check_net_page.dart';
import 'package:quize_u/home/home_page.dart';
import 'package:quize_u/profile/peofile_page.dart';
import 'package:quize_u/score_board/score_board_page.dart';

class TerminalPoint extends StatefulWidget {
  TerminalPoint({this.indexPage, Key? key}) : super(key: key);
  int? indexPage;

  @override
  State<TerminalPoint> createState() => _TerminalPointState();
}

class _TerminalPointState extends State<TerminalPoint> {
  late int index;
  @override
  void initState() {
    super.initState();
    index = widget.indexPage ?? 0;
  }

  List<Widget> screen = [
    HomePage(),
    const ScoreBoardPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.scoreboard_outlined),
            label: 'Board',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.portrait),
            label: 'Profile',
          ),
        ],
        currentIndex: index,
        selectedLabelStyle: const TextStyle(fontFamily: 'Acme'),
        showUnselectedLabels: false,
        elevation: 0,
        onTap: (int innerIndex) async {
          index = innerIndex;
          if (innerIndex == 1) {
            _checkScoreboardConnection(context);
          }
          setState(() {});
        },
      ),
      body: screen[index],
    );
  }
}

_checkScoreboardConnection(BuildContext context) async {
  try {
    var result = await InternetAddress.lookup('google.com');
    if (result.length == 2) {
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => CheckNetPage(
                    fromWhere: 'score',
                  )));
    }
  } catch (e) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => CheckNetPage(
                  fromWhere: 'score',
                )));
  }
}
