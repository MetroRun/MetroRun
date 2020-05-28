import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String username;
  final String uid;
  DatabaseService({this.uid, this.username});

  final CollectionReference deetsColl =
      Firestore.instance.collection('UserDetails');

  Future updateUserData(String name, String username, String phoneNumber,
      String email, String password, double cash) async {
    print("update user data");
    return await deetsColl.document(uid).setData({
      'name': name,
      'username': username,
      'phoneNumber': phoneNumber,
      'email': email,
      'password': password,
      'cash': cash
    });
  }
}
