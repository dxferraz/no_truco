import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

class FirestoreServices {
  static saveUser(String name, String email, String uid) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'name': name,
      'email': email,
    });
  }

  Future<String?> getUserName() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;

    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data()!;
      String? name = data['name'];
      return name;
    } else {
      return null;
    }
  }

  static saveMatchHistory(
      String userEmail, num userScore, num opponentscore) async {
    var uid = const Uuid().toString();
    var userId = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance.collection('match-history').doc(uid).set({
      'userId': userId,
      'email': userEmail,
      'userScore': userScore,
      'opponentscore': opponentscore,
    });
  }
}
