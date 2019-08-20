import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_a/signIn.dart';
import 'package:flutter_a/SignUp.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("My App")
      ),
      body: Column(

    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text("Welcome",textAlign: TextAlign.center,style: TextStyle(fontSize: 32,color: Colors.black87),),
        RaisedButton(
          onPressed: NavigatetoSignIn,
          child: Text("Sign in"),
        ),

        RaisedButton(
          onPressed:NavigatetoSignUp,
          child: Text("Sign Up"),
        )

      ],
    ),);
  }


  void NavigatetoSignIn() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }


  void NavigatetoSignUp() {
     Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }

}



