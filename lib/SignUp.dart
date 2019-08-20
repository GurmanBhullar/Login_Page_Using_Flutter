import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_a/signIn.dart';
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _email, _password;
  final GlobalKey<FormState> _Formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title: Text('Sign Up'),
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
              child: Text('Sign Up'),
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
            .createUserWithEmailAndPassword(email: _email, password: _password);

        Navigator.of(context).pop();

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));


      }catch(e){

        print(e.message);
      }




    }
  }
}
