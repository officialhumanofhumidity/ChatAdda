import 'package:chat_adda/views/signin.dart';
import 'package:chat_adda/views/signup.dart';
import"package:flutter/material.dart";
class Authentication extends StatefulWidget {
  bool ShowSignIn=true;
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {

  void Changeview(){
    setState(() {
      widget.ShowSignIn= !widget.ShowSignIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(widget.ShowSignIn){
      return SignIn(Changeview);
    }else
      {
        return SignUp(Changeview);
      }
  }
}
