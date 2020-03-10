import 'package:calculator/calculator.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new SplashScreen(
            seconds: 14,
            navigateAfterSeconds: Calculator(),
            title: Text(
              'MaxterCalculator',
              style: TextStyle(
                  color: Colors.white, fontSize: 30, fontFamily: 'RobotoMono'),
            ),
            backgroundColor: Colors.black,
            styleTextUnderTheLoader: new TextStyle(),
            photoSize: 100.0,
            loaderColor: Colors.red));
  }
}
