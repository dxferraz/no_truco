import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:no_truco/services/functions/firebase_functions.dart';

class AuthServices {
  static signupUser(String fullName, String email, String password,
      BuildContext context) async {
    debugPrint("Signing up");
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await FirebaseAuth.instance.currentUser!.updateEmail(email);
      await FirebaseAuth.instance.currentUser!.updateDisplayName(fullName);
      await FirestoreServices.saveUser(
        fullName,
        email,
        userCredential.user!.uid,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
          //TODO: Translate this

          'Registration Successful',
        )),
      );
      debugPrint("Signed up");
    } on FirebaseAuthException catch (e) {
      debugPrint("Error: " + e.code);
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            //TODO: Translate this
            'The password provided is too weak.',
          ),
        ));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            //TODO: Translate this
            'The account already exists for that email.',
          ),
        ));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static signinUser(
    String email,
    String password,
    BuildContext context,
  ) async {
    debugPrint("Signing in");
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            //TODO: Translate this
            'You are logged in',
          ),
        ),
      );
      debugPrint("Signed in");
    } on FirebaseAuthException catch (e) {
      debugPrint("Error: " + e.code);
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              //TODO: Translate this
              'No user found for that email.',
            ),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              //TODO: Translate this
              'Wrong password provided.',
            ),
          ),
        );
      }
    }
  }

  static signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void signOutUser() async {
    await FirebaseAuth.instance.signOut();
    // Redirecione para a página de login ou faça qualquer outra ação necessária após a desautenticação.
  }
}
