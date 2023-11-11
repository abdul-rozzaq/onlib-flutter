// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:onlib/screens/connection_error_screen.dart';
import 'package:onlib/services/prefs.dart';

class Requests {
  static String domain = 'http://192.168.1.2:8000';

  static Future<http.Response?> get(BuildContext context, String url) async {
    try {
      http.Response response = await http.get(Uri.parse(domain + url));

      //! token bilan tekshirish kerak

      debugPrint("GET $url ${response.statusCode}");
      return response;
    } on SocketException {
      return Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const ConnectionErrorScreen(),
        ),
        (route) => false,
      );
    }
  }

  static Future<http.Response?> post(BuildContext context, String url, Map data, {bool withToken = true}) async {
    try {
      http.Response response = await http.post(Uri.parse(domain + url), body: data);

      //! token bilan tekshirish kerak

      debugPrint("POST $url ${response.statusCode}");
      return response;
    } on SocketException {
      return Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const ConnectionErrorScreen(),
        ),
        (route) => false,
      );
    }
  }

  static Future<http.Response> specialGet(String url, {String? token}) async {
    http.Response response = await http.get(Uri.parse(domain + url), headers: {"Authorization": "Token ${token ?? await Prefs.getToken()}"});

    return response;
  }
}
