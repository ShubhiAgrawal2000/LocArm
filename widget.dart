import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class widgetTree extends StatelessWidget {
  widgetTree(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
          backgroundColor: Colors.teal[800],
          title: Center(
            child: Text(
                "LocArm"
            ),
          ),
      ),
    );
  }
}

InputDecoration inpdec(String hint){
  return InputDecoration(
    hintText: hint,
    hintStyle: TextStyle(
      color: Colors.teal,
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.teal[700]),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.teal[700]),
    ),
  );
}

TextStyle ts(){
  return TextStyle(
     color: Colors.teal,
    fontSize: 17.0,
  );
}