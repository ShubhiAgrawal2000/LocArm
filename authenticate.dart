import 'package:flutter/material.dart';
import 'package:loc_arm/screens/SignIn.dart';
import 'package:loc_arm/screens/SignUp.dart';
import 'package:loc_arm/screens/home.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool signIn = true;
  void toggle(){
    setState(() => signIn = !signIn);
  }
  @override
  Widget build(BuildContext context) {
    // Home();
    if(signIn){
      return SignIn(view: toggle);
    }
    else{
      return SignUp(view: toggle);
    }

  }
}
