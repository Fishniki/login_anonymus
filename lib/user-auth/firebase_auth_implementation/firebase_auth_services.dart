

import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_anonymus/global/thoast.dart';

class FirebasAuthServices {
  // ignore: prefer_final_fields
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(String email, String password) async {
    
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use"){
        nottifMelayang(message: "Email sudah digunakan");
      }else {
        nottifMelayang(message: "Terjadi kesalahan: ${e.code}");
      }
    }
    return null;
  }

   Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found" || e.code == "wrong-password"){
        nottifMelayang(message: "Email atau password salah");
      }else {
        nottifMelayang(message: "Terjadi kesalalhan:${e.code}");
      }
    }
    return null;
  }
}

