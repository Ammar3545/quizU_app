import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quize_u/api/api_resource.dart';
import 'package:quize_u/check_net/provider/check_net_provider.dart';
import 'package:quize_u/login/check_email_page.dart';
import 'package:quize_u/shredpreference/sharedpreference_link.dart';
import 'package:quize_u/terminal_point.dart';

class LoginProvider extends ChangeNotifier {
  registerAndVerificationInFirebase(
      {required String email,
      required String name,
      required BuildContext context}) async {
    UserCredential cre;
    try {
      cre = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: name + '734322071');
      User user = FirebaseAuth.instance.currentUser!;
      user.reload();
      await user.sendEmailVerification();
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const CheckEmailPage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        log('login...');
        cre = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: name + '734322071',
        );

        User? user = FirebaseAuth.instance.currentUser;
        await Future.delayed(const Duration(seconds: 3));
        user!.reload();
        if (user.emailVerified) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => TerminalPoint()));
        }
      }
      if (e.code == 'wrong-password') {
        Provider.of<CheckNetProvider>(context, listen: false)
            .snackBarNotification(
                context: context,
                message: 'Please check your password and try again');
      }
    }
  }

  Future<String> registerUser(
      {required String email, required String name}) async {
    String message =
        await ApiResource().loginAndRegisterPlayer(name: name, email: email);
    return message;
  }

  manageUserLogin(
      {required String email,
      required String name,
      required BuildContext context}) async {
    try {
      var result = await InternetAddress.lookup('google.com');
      if (result.length == 2) {
        String msg = await registerUser(email: email, name: name);
        if (msg != 'already Player') {
          registerAndVerificationInFirebase(
              email: email, name: name, context: context);
        }
        SharedPreferencesLink()
            .saveUserInfo(key: 'userInfo', userInfo: [name, email]);
      } else {
        Provider.of<CheckNetProvider>(context, listen: false)
            .snackBarNotification(
                context: context,
                message: 'Please check your Internet Connection and try again');
      }
    } catch (e) {
      Provider.of<CheckNetProvider>(context, listen: false)
          .snackBarNotification(
              context: context,
              message: 'Please check your Internet Connection and try again');
    }
  }
}
