import 'package:flutter/material.dart';
import 'package:loc_arm/services/auth.dart';
import 'package:loc_arm/wrapper.dart';
import 'package:provider/provider.dart';
import 'modal/user.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
