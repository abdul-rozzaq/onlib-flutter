// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:onlib/components/blur_widget.dart';
import 'package:onlib/components/loading_widget.dart';
import 'package:onlib/components/outlined_button.dart';
import 'package:onlib/components/primary_button.dart';
import 'package:onlib/components/simple_input.dart';
import 'package:onlib/models/user_model.dart';
import 'package:onlib/screens/auth/sign_up_screen.dart';
import 'package:onlib/screens/home_screen.dart';
import 'package:onlib/services/prefs.dart';
import 'package:onlib/services/requests.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String errorMessage = "";

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        getBackgroundImage(),
        getFadeColor(),
        GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            extendBody: true,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: const Text(
                'Kirish',
              ),
            ),
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Blur(
                        child: Container(
                          padding: const EdgeInsets.only(left: 15, bottom: 15, right: 15, top: 5),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white.withOpacity(.4)),
                            color: Colors.white.withOpacity(.2),
                          ),
                          child: Column(
                            children: [
                              SimpleInput(
                                controller: usernameController,
                                icon: Icons.person_outline,
                                label: 'Foydalanuvchi nomi',
                                keyboardType: TextInputType.emailAddress,
                                focusNode: focusNode,
                              ),
                              const SizedBox(height: 5),
                              SimpleInput(
                                controller: passwordController,
                                icon: Icons.lock_outline,
                                label: 'Parol',
                                obscureText: true,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      if (errorMessage != '')
                        Text(
                          errorMessage,
                          style: const TextStyle(
                            color: Colors.red,
                            shadows: [
                              Shadow(
                                color: Colors.white,
                                blurRadius: 15,
                              ),
                            ],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      if (errorMessage != '') const SizedBox(height: 10),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          'Parolni unutdingizmi?',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () => login(),
                        child: const PrimaryButton(text: 'Kirish'),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 1.5,
                              color: Colors.white.withOpacity(.5),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            'yoki',
                            style: TextStyle(color: Colors.white.withOpacity(.8)),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Divider(
                              thickness: 1.5,
                              color: Colors.white.withOpacity(.5),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const SignUpScreen()),
                        ),
                        child: const SimpleOutlinedButton(text: 'Ro\'yhatdan o\'tish'),
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getBackgroundImage() {
    Size size = MediaQuery.of(context).size;

    return Image.asset(
      'assets/images/login.png',
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

  Future login() async {
    FocusManager.instance.primaryFocus!.unfocus();

    showLoading(context);

    if (usernameController.text.trim() != '' && passwordController.text.trim() != '') {
      Response response = (await Requests.post(context, '/auth/login/', {
        'username': usernameController.text.trim(),
        'password': passwordController.text.trim(),
      }))!;

      if (response.statusCode == 200) {
        Map jsonData = jsonDecode(response.body);

        String token = jsonData['token'];
        User user = User.fromJson(jsonData['user']);

        await Prefs.setToken(token);
        await Prefs.setUser(user);

        return Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      } else {
        setState(() {
          errorMessage = jsonDecode(response.body)['error'];
        });

        passwordController.clear();
        focusNode.requestFocus();
      }
    }
    Navigator.pop(context);
  }
}
