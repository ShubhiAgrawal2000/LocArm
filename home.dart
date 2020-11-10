import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:loc_arm/screens/map.dart';
import 'package:loc_arm/services/auth.dart';
import 'package:loc_arm/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  Position _currentPosition;

  // Future<Position> currentLocation(){
  //   try{
  //     setState(() async{
  //       _currentPosition = await Geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.best,
  //         timeLimit: Duration(seconds: 10),
  //       );
  //     });
  //   }catch(e){
  //     print(e);
  //   }
  //   print(_currentPosition);
  // }

  // Future<bool> locationSettings()async{
  //   bool isLocationServiceEnabled  = await Geolocator.isLocationServiceEnabled();
  //   return isLocationServiceEnabled;
  // }


  @override
  Widget build(BuildContext context) {

    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().task,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home Screen, set ur alarm"),
          actions: <Widget>[
            FlatButton.icon(
                onPressed: ()async{
                    await _auth.signOut();
                },
                icon: Icon(Icons.person),
                label: Text("logout")),
          ],
        ),
        body: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "abc",
              ),
            ),
            SizedBox(height: 5.0),
            RaisedButton(
              child: Text("Go to Maps"),
              onPressed: ()async{
               // print(_currentPosition.latitude);
                final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
                print("Location is $position");
                // print(position.latitude);
                // print(position.longitude);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Maps(position.latitude,position.longitude)),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}


//  await Geolocator.openLocationSettings();

// Future currentLocation() async{
//   try{
//     permission = await Geolocator.requestPermission();
//     print(permission);
//     return permission;
//   }
//   catch(e){
//     print(e.toString());
//     return null;
//   }
// }

// LocationPermission permission = await Geolocator.requestPermission();

// if (_currentPosition != null)
//                   Text("LAT: ${_currentPosition.latitude}, LNG: ${_currentPosition.longitude}");

// MaterialPageRoute(builder: (context) => Maps(latitude:position.latitude, longitude:position.longitude)),

// print("abc");
//   Navigator.push(
//   context,
//    MaterialPageRoute(builder: (context) => Maps()),

// if(_currentPosition != null){
//   MaterialPageRoute(builder: (context) => Maps(latitude:_currentPosition.latitude, longitude:_currentPosition.longitude)),
// },

// final Geolocator geolocator = Geolocator().forceAndroidLocationManager;
//
// _getCurrentLocation() {
//   Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
//       .then((Position position) {
//     setState(() {
//       _currentPosition = position;
//     });
//     _getAddressFromLatLng();
//   }).catchError((e) {
//     print(e);
//   });
// }
