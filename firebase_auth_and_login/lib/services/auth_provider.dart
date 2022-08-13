import 'package:firebase_auth/firebase_auth.dart';
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
}
