import 'package:flutter/material.dart';
import 'package:uumlofoss/screenlofoss/authenticate/register.dart';
import 'package:uumlofoss/screenlofoss/authenticate/sign_in.dart';
import 'package:uumlofoss/screenlofoss/authenticate/sign_in.dart';


class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}
class _AuthenticateState extends State<Authenticate> {
bool showSignIn = true;
void toggleView(){
  setState(()=>showSignIn=false);
}
  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return SignIn(toggleView: toggleView);
    }else{
      return Register(toggleView: toggleView);
    }  
  }
}
