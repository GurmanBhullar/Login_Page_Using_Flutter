import 'package:flutter/material.dart';
import 'package:flutter_a/signIn.dart';
import 'package:flutter_a/welcome.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase demo',
      theme: ThemeData(


      ),
      home: WelcomePage(),
    );

  }
}


