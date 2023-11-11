import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onlib/components/white_button.dart';
import 'package:onlib/components/outlined_button.dart';
import 'package:onlib/screens/auth/login_screen.dart';
import 'package:onlib/screens/auth/sign_up_screen.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));

    return Scaffold(
      body: Stack(
        children: [
          getBackgroundImage(),
          getFadeColor(),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'OnLib',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'Halollik foydadan ustun!',
                  style: TextStyle(
                    color: Colors.white.withAlpha(155),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 25),
                InkWell(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen())),
                  child: const WhiteButton(text: 'Kirish'),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SignUpScreen())),
                  child: const SimpleOutlinedButton(text: 'Ro\'yhatdan o\'tish'),
                ),
                const SizedBox(height: 60),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getBackgroundImage() {
    Size size = MediaQuery.of(context).size;

    return Image.asset(
      'assets/images/background.png',
      fit: BoxFit.cover,
      height: size.height,
      width: size.width,
    );
  }

  Widget getFadeColor() => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          color: Colors.blueAccent.withOpacity(0.3),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
      );
}
