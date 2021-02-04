import 'package:firebase_auth/firebase_auth.dart';
import 'package:medizorg/utils/strings.dart';

class Authenticator {
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  static Future<String> signInUser(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return FEEDBACK_SUCCESS;
    } on FirebaseAuthException catch (e) {
      if (e.code == ERROR_MESSAGE_USER_NOT_FOUND) {
        print('No user found for that email.');
        return ERROR_MESSAGE_USER_NOT_FOUND;
      } else if (e.code == ERROR_MESSAGE_WRONG_PASSWORD) {
        print('Wrong password provided for that user.');
        return ERROR_MESSAGE_WRONG_PASSWORD;
      } else {
        return e.code;
      }
    }
  }

  static createUser(String email, String password) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == ERROR_MESSAGE_WEAK_PASSWORD) {
        print('The password provided is too weak.');
      } else if (e.code == ERROR_MESSAGE_EMAIL_ALREADY_USED) {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
