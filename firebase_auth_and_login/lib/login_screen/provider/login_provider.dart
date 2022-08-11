import 'package:firebase_auth_and_login/sign_up_screen/view/sign_up_screen.dart';
import 'package:firebase_auth_and_login/utils/utilities.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreenProvider with ChangeNotifier {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
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

  Container loginButton(BuildContext context) {
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
          checkLogin(context);
        },
      ),
    );
  }

  void checkLogin(BuildContext ctx) async {
    final userName = usernameController.text;
    final password = passwordController.text;
    if (userName == 'ritvik' && password == 'hello') {
      //got to home
      IsDataMatched = true;
      final sharedPrefs = await SharedPreferences.getInstance();
      await sharedPrefs.setBool(SAVED_KEY_NAME, true);
      // Navigator.of(ctx).pushReplacement(
      //     MaterialPageRoute(builder: (ctx1) => const ScreenHome()));
    } else {
      IsDataMatched = false;
    }
  }

  TextFormField passwordTextField() {
    return TextFormField(
      controller: passwordController,
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
      controller: usernameController,
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
}
