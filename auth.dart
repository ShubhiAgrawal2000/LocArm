import 'package:firebase_auth/firebase_auth.dart';
import 'package:loc_arm/modal/user.dart';
import 'package:loc_arm/services/database.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user){
    return user!=null?User(uid: user.uid):null;
  }

  Stream<User> get user{
    return _auth.onAuthStateChanged
        .map((FirebaseUser user)=>_userFromFirebaseUser(user));
        //.map(_userFromFirebaseUser); this can also be used
  }

  Future signInAnon() async{
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }


  Future signInWithEmailAndPassword(String email, String password) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signUpWithEmailAndPassword(String email, String password) async{

    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      await DatabaseService(uid: user.uid).updateUserData(" ", " ");

      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }

    // Future resetPass(String email) async{
    //   try{
    //     return await _auth.sendPasswordResetEmail(email: email);
    //   }catch(e){
    //     print(e.toString());
    //   }
    // }

  }

}