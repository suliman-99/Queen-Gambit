import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthController {
  Future<String> signUp(String email, String password, String name) async {
    try {
      await Firebase.initializeApp();
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseAuth.instance.currentUser.updateDisplayName(name);
      return 'success';
    } on FirebaseAuthException catch (e) {
      if (e.message.length > 125) {
        return 'You need VPN';
      }
      return e.message;
    }
  }

  Future<String> logIn(String email, String password) async {
    try {
      await Firebase.initializeApp();
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return 'success';
    } on FirebaseAuthException catch (e) {
      if (e.message.length > 125) {
        return 'You need VPN';
      }
      return e.message;
    }
  }

  Future<String> logOut() async {
    try {
      await Firebase.initializeApp();
      await FirebaseAuth.instance.signOut();
      return 'success';
    } on FirebaseAuthException catch (e) {
      if (e.message.length > 125) {
        return 'You need VPN';
      }
      return e.message;
    }
  }
}
