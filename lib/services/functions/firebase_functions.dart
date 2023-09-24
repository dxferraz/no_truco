import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
var matchId = db.collection('matches').doc().id;
var userEmail = FirebaseAuth.instance.currentUser!.email;
var userId = FirebaseAuth.instance.currentUser!.uid;
var uid = const Uuid().toString();

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

  static updateMatch( 
    String winner,
    String aTeamName,
    String bTeamName,
    num aTeamPoints,
    num bTeamPoints,
  ) async {
    if (winner == "A" || winner == "B") {
    }
    await db.collection('matches').doc(matchId).set({
      'userId': userId,
      'email': userEmail,
      'winner': winner,
      'aTeamName': aTeamName,
      'bTeamName': bTeamName,
      'aTeamPoints': aTeamPoints.toString(),
      'bTeamPoints': bTeamPoints.toString(),
    });
  }

  static createNewMatch(
    String aTeamName,
    String bTeamName,
    num aTeamPoints,
    num bTeamPoints,
  ) async {
    try {
      await db.collection('matches').add({
        'userId': userId,
        'data': DateTime.now().toString(),
        'aTeamName': aTeamName,
        'bTeamName': bTeamName,
        'aTeamPoints': aTeamPoints.toString(),
        'bTeamPoints': bTeamPoints.toString(),
      });
      debugPrint('Partida criada com sucesso!');
    } catch (e) {
      debugPrint('Erro ao criar a partida: $e');
    }
  }
}
