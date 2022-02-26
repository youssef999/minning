

 import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'main.dart';

//void main() => runApp(MyApp2());

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Clean Code',
        home: AnimatedSplashScreen(
          duration: 3000,
          splash: Container(
            height:800,
            child: Image.asset('assets/m1.png')),
          nextScreen:  MyApp(),
          splashTransition: SplashTransition.fadeTransition,
        //  pageTransitionType: PageTransitionType.scale,
          backgroundColor: Colors.amber,
        )
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
    );
  }
}