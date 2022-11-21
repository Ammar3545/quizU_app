import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quize_u/login/login_page.dart';
import 'package:quize_u/shredpreference/sharedpreference_link.dart';

class ProfileProvider extends ChangeNotifier {
  List<String> userInfoList = [];
  late bool _loading;

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  getUserInformation() async {
    loading = true;
    userInfoList = await SharedPreferencesLink().getUserInfo(key: 'userInfo');
    loading = false;
  }

  loguot({required String key}) {
    SharedPreferencesLink().logoutUser(key: key);
  }

  Widget logoutWidget({required double width, required BuildContext context}) {
    return AlertDialog(
      title: Text(
        'Logout',
        style: TextStyle(fontFamily: 'Acme', fontSize: width * 0.05),
      ),
      content: const Text(
        'You`r Went to Logout !',
        style: TextStyle(
          fontFamily: 'Ami',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Cancel',
            style: TextStyle(
              fontFamily: 'Acme',
              color: Color(0XFFb4bc07),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            loguot(key: 'token');
            Navigator.pop(context);
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
          child: const Text(
            'Ok',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Acme',
            ),
          ),
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(const Color(0XFFb4bc07))),
        ),
      ],
    );
  }
}
