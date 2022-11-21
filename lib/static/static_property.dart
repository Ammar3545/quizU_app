class StaticProperty {
  String url = 'https://192.168.1.35:9090/api/players/';
  String tips = '''Before you start, you should know some helpful points
. You have two minutes to answer as many questions as possible .
. You only have one attempt to skip .
. When you answer incorrectly, do not count the score .
. When you have an incorrect answer, You have to start again .
. The score is calculated only when the time has expired or all questions have been answered .''';
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
}
