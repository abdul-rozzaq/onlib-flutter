import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:onlib/components/blur_widget.dart';
import 'package:onlib/components/outlined_button.dart';
import 'package:onlib/components/primary_button.dart';
import 'package:onlib/components/simple_input.dart';
import 'package:onlib/screens/auth/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        getBackgroundImage(),
        getFadeColor(),
        Scaffold(
          extendBody: true,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: const Text(
              'Hissob yaratish',
            ),
          ),
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Blur(
                      child: Container(
                        padding: const EdgeInsets.only(left: 15, bottom: 15, right: 15, top: 5),
                        // height: 190,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white.withOpacity(.4)),
                          color: Colors.white.withOpacity(.2),
                        ),
                        child: Column(
                          children: [
                            SimpleInput(
                              controller: TextEditingController(),
                              icon: Icons.contact_mail_outlined,
                              label: 'Ism Familiya',
                            ),
                            const SizedBox(height: 5),
                            SimpleInput(
                              controller: TextEditingController(),
                              icon: Icons.person_outline,
                              label: 'Foydalanuvchi nomi',
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(height: 5),
                            SimpleInput(
                              controller: TextEditingController(),
                              icon: Icons.email_outlined,
                              label: 'Email',
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(height: 5),
                            SimpleInput(
                              controller: TextEditingController(),
                              icon: Icons.lock_outline,
                              label: 'Parol',
                              obscureText: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const PrimaryButton(text: 'Ro\'yhatdan o\'tish'),
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
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen())),
                      child: const SimpleOutlinedButton(text: 'Kirish'),
                    ),
                    const SizedBox(height: 50),
                  ],
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
      'assets/images/signup.jpeg',
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
