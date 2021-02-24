import 'package:firebase_auth/firebase_auth.dart';

class Auth_Service {
  final FirebaseAuth _firebaseAuth;

  Auth_Service(this._firebaseAuth);
  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String> signIn({String Email, String Password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: Email, password: Password);
      return "Sign In";
    } on FirebaseAuthException catch (error) {
      return error.message;
    }
  }

  Future<String> signUp({String Email, String Password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: Email, password: Password);
      return "Sign Up";
    } on FirebaseAuthException catch (error) {
      return error.message;
    }
  }

  Future<String> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return "Sign Out";
    } on FirebaseAuthException catch (error) {
      return error.message;
    }
  }
  Future<String> Auth_ID() async {
    try {
      final User_ID =  await _firebaseAuth.currentUser.uid;
      return "$User_ID";
    } on FirebaseAuthException catch (error) {
      return error.message;
    }
  }
  Future<String> ForgottenEmail({String Email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: Email);
      return "Email Reset";
    } on FirebaseAuthException catch (error) {
      return error.message;
    }
  }
}
