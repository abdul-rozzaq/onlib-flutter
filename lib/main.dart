import 'dart:io';

import 'package:flutter/material.dart';
import 'package:onlib/components/scroll_physics.dart';
import 'package:onlib/screens/auth/index_screen.dart';
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
      home: const IndexScreen(),
    );
  }
}

// SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
//   statusBarColor: Colors.white,
//   statusBarIconBrightness: Brightness.dark,
//   statusBarBrightness: Brightness.dark,
// ));
