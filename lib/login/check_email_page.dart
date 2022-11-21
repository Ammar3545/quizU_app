import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quize_u/terminal_point.dart';

class CheckEmailPage extends StatefulWidget {
  const CheckEmailPage({Key? key}) : super(key: key);

  @override
  State<CheckEmailPage> createState() => _CheckEmailPageState();
}

class _CheckEmailPageState extends State<CheckEmailPage>
    with WidgetsBindingObserver {
  late User user;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    // TODO: implement didChangeAppLifecycleState
    if (state == AppLifecycleState.resumed) {
      await Future.delayed(const Duration(seconds: 2));
      user = FirebaseAuth.instance.currentUser!;
      await Future.delayed(const Duration(seconds: 2));
      await user.reload();
      await Future.delayed(const Duration(seconds: 2));
      if (user.emailVerified) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => TerminalPoint()));
      }
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.mark_as_unread_outlined,
              size: width * 0.4,
              color: const Color.fromARGB(190, 245, 232, 134),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.05),
              child: Text(
                'Please Check Your Email to Confirm Your Account ',
                style: TextStyle(
                  fontFamily: 'Acme',
                  fontSize: width * 0.04,
                  color: const Color(0XFF9e9596),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.05),
              child: Text(
                'Please Check Spam in Your Email if You don`t find\n Verification Email in The intbox ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Acme',
                  fontSize: width * 0.03,
                  color: const Color(0XFF9e9596),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
