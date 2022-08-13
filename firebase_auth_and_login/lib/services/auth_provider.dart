import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  FirebaseAuth _fa;
  AuthProvider(this._fa);
  Stream<User?> stream() => _fa.authStateChanges();
}
