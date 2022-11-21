import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quize_u/profile/provider/profile_proivder.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ProfileProvider>(context, listen: false).getUserInformation();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Consumer<ProfileProvider>(
      builder: (context, profileProvider, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Profile',
            style: TextStyle(color: Colors.black, fontFamily: 'Acme'),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey[100],
          elevation: 0,
        ),
        body: profileProvider.loading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: width * 0.06, vertical: height * 0.02),
                    width: width * 0.9,
                    height: height * 0.3 * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.07),
                      gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0XFFed6f9f),
                            Color(0XFFec7d84),
                            Color(0XFFec8b6b),
                          ]),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: width * 0.05),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.all(width * 0.01),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        width * 0.04 * 0.9),
                                    border: Border.all(
                                        color: Colors.white,
                                        width: width * 0.001)),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: width * 0.07,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) =>
                                          profileProvider.logoutWidget(
                                              width: width, context: context));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: width * 0.05),
                                  padding: EdgeInsets.all(width * 0.01),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(width * 0.05),
                                      border: Border.all(
                                          color: Colors.white,
                                          width: width * 0.001)),
                                  child: Icon(
                                    Icons.logout_outlined,
                                    color: Colors.white,
                                    size: width * 0.06,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Text(
                            profileProvider.userInfoList[0],
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Ami',
                                fontSize: width * 0.05),
                          ),
                          Text(
                            profileProvider.userInfoList[1],
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Acme',
                                fontSize: width * 0.06),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
