import 'package:flutter/material.dart';
import 'package:quize_u/login/login_page.dart';
import 'package:quize_u/shredpreference/sharedpreference_link.dart';
import 'package:quize_u/terminal_point.dart';

class IntermediaryPoint extends StatelessWidget {
  const IntermediaryPoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SharedPreferencesLink().isTokenExiste(keyName: 'token'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data == true) {
            return TerminalPoint();
          }
          return LoginPage();
        }
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
