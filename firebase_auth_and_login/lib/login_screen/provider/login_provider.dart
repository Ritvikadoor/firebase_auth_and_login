import 'package:firebase_auth_and_login/services/auth_provider.dart';
import 'package:firebase_auth_and_login/sign_up_screen/view/sign_up_screen.dart';
import 'package:firebase_auth_and_login/utils/utilities.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreenProvider with ChangeNotifier {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();

  bool IsDataMatched = true;
  var SAVED_KEY_NAME;

  TextButton signUpButton(BuildContext context) {
    return TextButton(
      child: const Text(
        'Sign Up?',
        style: TextStyle(fontSize: 16, color: Colors.red),
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SignUpScreen(),
          ),
        );
        // checkLogin(context);
      },
    );
  }

  TextFormField passwordTextField() {
    return TextFormField(
      controller: _pass,
      decoration: InputDecoration(
          fillColor: Colors.black.withOpacity(0.2),
          filled: true,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          hintText: 'Password'),
      validator: (_) {
        if (IsDataMatched) {
          return null;
        } else {
          return 'error';
        }
      },
    );
  }

  TextFormField emailTextField() {
    return TextFormField(
      controller: _email,
      decoration: InputDecoration(
          fillColor: Colors.black.withOpacity(0.2),
          filled: true,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          hintText: emailText),
      validator: (_) {
        if (IsDataMatched) {
          return null;
        } else {
          return 'error';
        }
      },
    );
  }

  Container loginButton(BuildContext context) {
    void signIn(AuthProvider provider) async {
      final msg = await provider.signIn(_email.text, _pass.text);
      if (msg == "") return;

      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
    }

    final authProvider = context.watch<AuthProvider>();
    return Container(
      height: 40,
      width: 100,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.red,
          minimumSize: const Size.fromHeight(50),
        ),
        child: const Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        onPressed: () {
          if (authProvider.loading) CircularProgressIndicator();
          if (!authProvider.loading) signIn(authProvider);
          // Navigator.of(context).pushReplacement(
          // MaterialPageRoute(builder: (ctx1) => const HomeScreen()));
        },
      ),
    );
  }
}
