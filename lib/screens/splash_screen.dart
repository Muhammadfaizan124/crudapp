import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:crudapp/screens/work_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 6), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const WorkScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedTextKit(
          animatedTexts: [
            RotateAnimatedText(
              "To",
              duration: const Duration(seconds: 1),
              textStyle:
                  const TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
            ),
            RotateAnimatedText(
              "Do",
              duration: const Duration(seconds: 1),
              textStyle:
                  const TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
            ),
            RotateAnimatedText(
              "App",
              duration: const Duration(seconds: 1),
              textStyle:
                  const TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
            ),
          ],
          totalRepeatCount: 1,
        ),
      ),
    );
  }
}
