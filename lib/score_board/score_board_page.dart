import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quize_u/custom_widgets/circle_widget.dart';
import 'package:quize_u/score_board/provider/scoreboard_provider.dart';

class ScoreBoardPage extends StatefulWidget {
  const ScoreBoardPage({Key? key}) : super(key: key);

  @override
  State<ScoreBoardPage> createState() => _ScoreBoardPageState();
}

class _ScoreBoardPageState extends State<ScoreBoardPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ScoreboardProvider>(context, listen: false).getPlayerScore();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Consumer<ScoreboardProvider>(
      builder: (context, scoreboardProvider, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Leaderboard',
            style: TextStyle(color: Colors.black, fontFamily: 'Acme'),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey[100],
          elevation: 0,
        ),
        body: scoreboardProvider.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleWidget(
                        child: Center(
                          child: Text(
                            '${scoreboardProvider.topScore[2]}',
                            style: const TextStyle(
                                color: Colors.white, fontFamily: 'Acme'),
                          ),
                        ),
                        child2: const Center(
                            child: Text(
                          '2',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Acme'),
                        )),
                        borderColor: const Color(0XFFb4b4b5),
                        colors: const [Color(0XFFde3e52), Color(0XFFe3314d)],
                        radius: width * 0.4,
                        width: width * 0.3 * 0.7,
                        height: height * 0.2 * 0.5,
                        topPosition: height * 0.09 * 0.96,
                        leftPosition: width * 0.09 * 0.95,
                      ),
                      CircleWidget(
                        child: Center(
                          child: Text(
                            '${scoreboardProvider.topScore[0]}',
                            style: const TextStyle(
                                color: Colors.white, fontFamily: 'Acme'),
                          ),
                        ),
                        child2: const Center(
                            child: Text(
                          '1',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Acme'),
                        )),
                        borderColor: const Color(0XFFf3c01a),
                        colors: const [Color(0XFFfbcfdf), Color(0XFFeb768a)],
                        radius: width * 0.4,
                        width: width * 0.3,
                        height: height * 0.2 * 0.7,
                        topPosition: height * 0.2 * 0.6,
                        leftPosition: width * 0.2 * 0.6,
                      ),
                      CircleWidget(
                        child: Center(
                          child: Text(
                            '${scoreboardProvider.topScore[1]}',
                            style: const TextStyle(
                                color: Colors.white, fontFamily: 'Acme'),
                          ),
                        ),
                        child2: const Center(
                            child: Text(
                          '3',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Acme'),
                        )),
                        borderColor: const Color(0XFFad8f5e),
                        colors: const [Color(0XFFa5c9d3), Color(0XFF4f93b2)],
                        radius: width * 0.4,
                        width: width * 0.3 * 0.7,
                        height: height * 0.2 * 0.5,
                        topPosition: height * 0.09 * 0.96,
                        leftPosition: width * 0.09 * 0.95,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: scoreboardProvider.playerScore.length,
                      itemBuilder: (context, index) => Container(
                        height: height * 0.07 * 0.9,
                        margin: EdgeInsets.symmetric(
                            horizontal: width * 0.06, vertical: height * 0.01),
                        decoration: BoxDecoration(
                          color: const Color(0XFFe7f9f9),
                          borderRadius: BorderRadius.circular(width * 0.04),
                        ),
                        child: ListTile(
                          contentPadding:
                              EdgeInsets.only(bottom: height * 0.01),
                          leading: Padding(
                            padding: EdgeInsets.only(
                              left: width * 0.03,
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: Icon(
                                Icons.scatter_plot,
                                size: width * 0.06,
                              ),
                            ),
                          ),
                          title: Center(
                              child: Text(
                            '${scoreboardProvider.playerScore[index]}',
                            style: const TextStyle(
                                color: Color(0XFF9e9596), fontFamily: 'Acme'),
                          )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
