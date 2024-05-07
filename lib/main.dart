import 'package:crudapp/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const Crudapp());
}

class Crudapp extends StatelessWidget {
  const Crudapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}