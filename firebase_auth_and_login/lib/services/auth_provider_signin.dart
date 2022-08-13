import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_and_login/home_screen/view/home_screen.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  FirebaseAuth _fa;
  AuthProvider(this._fa);
  bool _isLoading = false;
  Stream<User?> stream() => _fa.authStateChanges();
  bool get loading => _isLoading;

  Future<void> signOut() async {
    await _fa.signOut();
  }

  Future<String> signIn(String email, String password) async {
    try {
      _isLoading = true;
      notifyListeners();
      await _fa.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      _isLoading = false;
      notifyListeners();
      return Future.value('');
    } on FirebaseAuthException catch (e) {
      _isLoading = false;
      notifyListeners();
      return Future.value(e.message);
    }
  }

  Future<String> signUp(
      String email, String password, BuildContext context) async {
    try {
      _isLoading = true;
      notifyListeners();
      await _fa
          .createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim())
          .then((value) => Navigator.of(context)
              .push(MaterialPageRoute(builder: ((context) => HomeScreen()))));
      _isLoading = false;
      notifyListeners();
      return Future.value('');
    } on FirebaseAuthException catch (e) {
      _isLoading = false;
      notifyListeners();
      return Future.value(e.message);
    }
  }
}
