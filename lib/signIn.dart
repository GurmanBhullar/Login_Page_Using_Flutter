import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_a/home.dart';



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String _email, _password;
  final GlobalKey<FormState> _Formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title: Text('Sign In'),
      ),
          body: Form(
           key: _Formkey,
        child: Column(
        children: <Widget>[
          TextFormField(
        validator: (input){
          if(input.isEmpty){
            return 'Enter Email';
          // ignore: missing_return, missing_return
          }
    },
      onSaved: (input) => _email = input,
      decoration: InputDecoration(
        labelText: 'Email'
      ),
    ),

        TextFormField(
        validator: (input){
      if(input.length<6){
        return 'Enter Password more than 6 characters';
      }
    },
    onSaved: (input) => _password = input,
    decoration: InputDecoration(
    labelText: 'Password'
    ),
    ),

          RaisedButton(
             onPressed: signIn,
            child: Text('Sign In'),
          )


    ],
    ),
          ),
    );
  }

  Future<void> signIn() async{
    final formState = _Formkey.currentState;
    if(formState.validate()){
      formState.save();
      try {
        AuthResult user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      }catch(e){
        
        print(e.message);
      }




    }
  }
}
