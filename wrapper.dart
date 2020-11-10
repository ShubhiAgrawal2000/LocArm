import 'package:flutter/material.dart';
import 'package:loc_arm/screens/authenticate.dart';
import 'package:loc_arm/screens/home.dart';
import 'package:provider/provider.dart';
import 'modal/user.dart';

class Wrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    //return either home or authenticate
    if(user == null){
      return Authenticate();
    }
    else{
      return Home();
    }
  }
}