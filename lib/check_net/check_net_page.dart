import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quize_u/check_net/provider/check_net_provider.dart';
import 'package:quize_u/custom_widgets/button_widget.dart';

class CheckNetPage extends StatefulWidget {
  CheckNetPage({required this.fromWhere, Key? key}) : super(key: key);
  String fromWhere;

  @override
  State<CheckNetPage> createState() => _CheckNetPageState();
}

class _CheckNetPageState extends State<CheckNetPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<CheckNetProvider>(context, listen: false).loading = false;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Consumer<CheckNetProvider>(
      builder: (context, checkNetProvider, child) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.3,
              ),
              Icon(
                Icons.wifi_off_rounded,
                size: width * 0.5,
                color: const Color.fromARGB(190, 245, 232, 134),
              ),
              Text(
                'Please Check Your Intenet Connection',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Acme',
                  fontSize: width * 0.04,
                  color: const Color(0XFF9e9596),
                ),
              ),
              SizedBox(
                height: height * 0.3,
              ),
              checkNetProvider.loading
                  ? const Center(child: CircularProgressIndicator())
                  : ButtonWidget(
                      label: 'Check Connection',
                      colors: const [
                        Color(0XFFf1d603),
                        Color(0XFFb4bc07),
                      ],
                      onTap: () {
                        checkNetProvider.checkConnection(
                            from: widget.fromWhere, context: context);
                      },
                      width: width * 0.4,
                      height: height * 0.04,
                      fromLeftPaddin: width * 0.05,
                      fromTopPaddin: 0,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
