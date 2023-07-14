import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final int balance;
  final String username;
  final String password;
  final String name;
  final String age;
  final List notification;
  final String uid;
  final String profilePicture;

  const User({
    required this.profilePicture,
    required this.uid,
    required this.balance,
    required this.username,
    required this.age,
    required this.name,
    required this.notification,
    required this.password,
  });

  //Function to convert the user model to a Map
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'username': username,
      'password': password,
      'name': name,
      'balance': balance,
      'age': age,
      'notification': notification,
      'profilePicture': profilePicture,
    };
  }

  //Function to convert a DocumentSnapshot ( typically a Map ) to user object
  static User fromSnapshot(DocumentSnapshot doc) {
    Map<String, dynamic> userData = doc.data() as Map<String, dynamic>;
    return User(
      profilePicture: userData['profilePicture'],
      uid: userData['uid'],
      age: userData['age'],
      username: userData['username'],
      password: userData['password'],
      balance: userData['balance'],
      name: userData['name'],
      notification: userData['notification'],
    );
  }

  //balance, username, password,name ,age,notification
}
