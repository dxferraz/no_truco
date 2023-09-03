import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

class FirestoreServices {
  static saveUser(String name, String email, String uid) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'name': name,
      'email': email,
    });
  }
}