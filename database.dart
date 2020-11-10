import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});
  final CollectionReference taskCollection = Firestore.instance.collection('Task');

  Future updateUserData(String title, String description) async{
    return await taskCollection.document(uid).setData({
      'title':title,
      'description':description,
    });
  }

  Stream<QuerySnapshot> get task{
    return taskCollection.snapshots();
  }

}