import './splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext build) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-NewsPaper',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Muli',
        primaryColor: Colors.deepOrange,
        secondaryHeaderColor: Colors.deepOrangeAccent,
      ),
      home: SplashScreen(),
    );
  }
}
