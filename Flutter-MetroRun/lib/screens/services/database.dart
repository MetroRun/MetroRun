import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String username;
  final String uid;
  final String name;
  final String phoneNumber;
  final String email;
  final String password;
  var cash;
  DatabaseService(
      {this.uid,
      this.username,
      this.name,
      this.phoneNumber,
      this.email,
      this.password,
      this.cash});

  final CollectionReference deetsColl =
      Firestore.instance.collection('UserDetails');

  Future updateUserData(String name, String username, String phoneNumber,
      String email, String password, double cash) async {
    print("update user data");
    return await deetsColl.document(uid).setData({
      'Name': name,
      'Username': username,
      'PhoneNumber': phoneNumber,
      'Email': email,
      'Password': password,
      'Cash': cash
    });
  }
}
