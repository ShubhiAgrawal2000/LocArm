import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loc_arm/services/auth.dart';
import 'package:loc_arm/widget.dart';

class SignIn extends StatefulWidget {

  final Function view;
  SignIn({this.view});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  String email, password;
  String error="";
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      //wrap body Column with SingleChildScrollView widget if keyboard prob occurs
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "SignIn to get started",
                style: TextStyle(
                  fontSize: 50.0,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[700],
                  //fontFeatures: fontSize(19.0),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: Column(
                children: [
                  TextFormField(
                    style: ts(),
                    validator: (val)=>val.isEmpty?"Enter correct email":null,
                    decoration: inpdec("Email"),
                    onChanged: (val){
                      setState(() => email=val);
                    },
                  ),
                  SizedBox(height: 30.0),
                  TextFormField(
                    style: ts(),
                    validator: (val)=>val.length<6?"Enter valid password":null,
                    decoration: inpdec("Password"),
                    onChanged: (val){
                      setState(() => password=val);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            //Sign in anonymously
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
              alignment: Alignment.centerRight,
              child: Text("Forgot Password?", style: ts()),
            ),
            SizedBox(height: 20.0),
            RaisedButton(
              onPressed: ()async{
                if(_formKey.currentState.validate()){
                  dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                  if(result == null)
                  {
                    setState(() => error = "Enter valid email and password");
                  }
                }
               // _auth.signInWithEmail(email, password);
              },
              child: Text("Sign In",
                style: TextStyle(fontSize: 16.0),
              ),
              disabledTextColor: Colors.teal[200],
              color: Colors.teal[900],
              textColor: Colors.teal[200],
              disabledColor: Colors.teal[900],
              disabledElevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 20.0),
            ),
            Text(
              error,
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 14.0
              ),),
            SizedBox(height: 20.0),
            RaisedButton(onPressed: null,
              child: Text("Sign In with Google",
                style: TextStyle(fontSize: 16.0),
              ),
              disabledTextColor: Colors.teal[200],
              color: Colors.teal[900],
              textColor: Colors.teal[200],
              disabledColor: Colors.teal[900],
              disabledElevation: 20.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 20.0),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? ",
                    style: TextStyle(fontSize: 17.0,
                      color: Colors.teal[700],
                    ),
                ),
                Text("Register now",
                  style: TextStyle(fontSize: 17.0,
                    color: Colors.teal[700],
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.teal[800],
        title: Center(
          child: Text(
              "LocArm"
          ),
        ),
        actions: <Widget>[
          FlatButton.icon(onPressed: (){
            widget.view();
          }, icon: Icon(Icons.person), label: Text("SignUp"))
        ],
      ),
    );
  }
}
