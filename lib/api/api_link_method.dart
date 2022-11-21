import 'dart:convert';
import 'dart:io';

import 'package:http/io_client.dart';

class ApiLinkMethod {
  Future<Map<String, dynamic>> getMethod(
      {required String url, required Map<String, String> header}) async {
    final ioc = HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = IOClient(ioc);
    try {
      var response = await http.get(Uri.parse(url), headers: header);
      if (response.statusCode == 200) {
        var resJson = json.decode(response.body);
        return resJson;
      }
    } catch (e) {
      print(e.toString() + ' get');
    }
    return {};
  }

  Future<Map<String, dynamic>> postMethod(
      {required String url, required String body}) async {
    final ioc = HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = IOClient(ioc);
    try {
      var response = await http.post(
        Uri.parse(url),
        body: body,
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        var resJson = json.decode(response.body);
        return resJson;
      }
    } catch (e) {
      print(e.toString() + ' post');
    }
    return {};
  }
}
