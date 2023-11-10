import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlib/components/blur_widget.dart';
import 'package:onlib/components/outlined_button.dart';
import 'package:onlib/components/primary_button.dart';

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
            child: Padding(
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
                            icon: Icons.person_outline,
                            label: 'Ism Familiya',
                          ),
                          const SizedBox(height: 5),
                          SimpleInput(
                            controller: TextEditingController(),
                            icon: Icons.email_outlined,
                            label: 'Email',
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
                  const SimpleOutlinedButton(text: 'Kirish'),
                  const SizedBox(height: 50),
                ],
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

class SimpleInput extends StatefulWidget {
  const SimpleInput({
    super.key,
    required this.icon,
    required this.label,
    required this.controller,
    this.obscureText = false,
  });

  final IconData icon;
  final String label;
  final TextEditingController controller;
  final bool obscureText;

  @override
  State<SimpleInput> createState() => _SimpleInputState();
}

class _SimpleInputState extends State<SimpleInput> {
  bool obscureText = false;

  @override
  void initState() {
    super.initState();

    obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            widget.icon,
            color: Colors.white,
            size: 25,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              obscureText: obscureText,
              controller: widget.controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: widget.label,
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(.8),
                ),
              ),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          if (widget.obscureText)
            InkWell(
              onTap: () => setState(() => obscureText = !obscureText),
              child: Icon(
                obscureText ? CupertinoIcons.eye_fill : CupertinoIcons.eye_slash_fill,
                color: Colors.white,
                size: 25,
              ),
            ),
        ],
      ),
    );
  }
}
