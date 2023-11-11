import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:onlib/components/loading_widget.dart';
import 'package:onlib/components/scroll_physics.dart';
import 'package:onlib/models/user_model.dart';
import 'package:onlib/screens/auth/index_screen.dart';
import 'package:onlib/screens/connection_error_screen.dart';
import 'package:onlib/screens/home_screen.dart';
import 'package:onlib/services/prefs.dart';
import 'package:onlib/services/requests.dart';
import 'package:onlib/services/themes.dart';

void main() {
  runApp(
    const App(),
  );
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: Platform.isAndroid ? ScrollBehaviorModified() : null,
      themeMode: ThemeMode.light,
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      home: const Init(),
    );
  }
}

class Init extends StatelessWidget {
  const Init({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: checkUser(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.error != null) return const ConnectionErrorScreen();
          if (snapshot.data != null) return const HomeScreen();
          return const IndexScreen();
        }
        return const Scaffold(body: LoadingWidget());
      },
    );
  }

  Future checkUser(BuildContext context) async {
    String? token = await Prefs.getToken();

    if (token == null) return null;

    Response data = await Requests.specialGet('/auth/get-me/', token: token);

    if (data.statusCode == 200) {
      Map jsonData = jsonDecode(utf8.decode(data.bodyBytes));

      User user = User.fromJson(jsonData);

      await Prefs.setUser(user);

      return user;
    }

    return null;
  }
}

// SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
//   statusBarColor: Colors.white,
//   statusBarIconBrightness: Brightness.dark,
//   statusBarBrightness: Brightness.dark,
// ));
